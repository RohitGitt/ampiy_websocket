import 'package:ampiy/app/app.locator.dart';
import 'package:ampiy/services/easyLoading/easyLoadingService.dart';
import 'package:ampiy/ui/common/consts/api.consts.dart';
import 'package:web_socket_channel/io.dart';

abstract class WebSocket {

  IOWebSocketChannel? socket ;
  
  connectToServer(){
    try{
      socket = IOWebSocketChannel.connect(ApiConsts.webSocketUrl);
    }catch(err){
      locator<EasyLoadingService>().showErrorToast(title: "Websocket Error" , description: err.toString());
    }
  }

  close() async{
    await socket?.sink.close();
  }
}
