import 'dart:convert';
import 'package:ampiy/app/app.locator.dart';
import 'package:ampiy/app/app.logger.dart';
import 'package:ampiy/data/Home/AllCoinsDataResponse.dto.dart';
import 'package:ampiy/data/Home/GetAllCoinsRequestDTO.dart';
import 'package:ampiy/services/easyLoading/easyLoadingService.dart';
import 'package:ampiy/services/home/webSocketService.dart';
import 'package:ampiy/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FormViewModel {
  final _logger = getLogger("HomeViewModel");
  final _webSocketService = locator<WebSocketService>();

  final _easyLoadingService = locator<EasyLoadingService>();

  List<AllCoinsDataResponseDTOData?>? _allData;
  List<AllCoinsDataResponseDTOData?>? _data;
  List<AllCoinsDataResponseDTOData?>? get data => _data ?? [];

  void initialize() {
    try{
      _easyLoadingService.showLoader();
    _webSocketService.subscription?.onData((message) {
      _allData = AllCoinsDataResponseDTO.fromJson(jsonDecode(message)).data;
      _data = ((searchValue == null) || (searchValue?.isEmpty ?? true))
          ? _allData
          : filter(_allData);
      notifyListeners();
    });

    _webSocketService.subscription?.onError((error) {
      _easyLoadingService.showErrorToast(
          title: "WebSocketError", description: error.toString());
    });

    _webSocketService.subscription?.onDone(() {
      _webSocketService.removeListner();
      _webSocketService.closeSocket();
    });

    if (_webSocketService.subscription?.isPaused ?? false) {
      _webSocketService.subscription?.resume();
    } else {
      makeAllCoinsStreamRequest();
    }
    _easyLoadingService.removeLoader();
    }catch(err){
      _easyLoadingService.showErrorToast(title: "Error", description: err.toString());
    }
    
  }

  makeAllCoinsStreamRequest() {
    _webSocketService.sendMessage(jsonEncode(GetAllCoinsDataRequestDTO(
            method: "SUBSCRIBE", params: ["all@ticker"], cid: 1)
        .toJson()));
  }

  List<AllCoinsDataResponseDTOData?>? filter(
      List<AllCoinsDataResponseDTOData?>? itemList) {
    _logger.e("filter got called $searchValue");
    if (itemList == null) {
      return null;
    }
    if ((searchValue != null) && (searchValue?.isNotEmpty ?? false)) {
      return itemList
          .where((item) => item?.T != null
              ? item!.T!.toLowerCase().contains(searchValue!.toLowerCase())
              : false)
          .toList();
    }
    return null;
  }

  @override
  void dispose() {
    _webSocketService.subscription?.pause();
    _logger.e("dispose method called");
    super.dispose();
  }
}
