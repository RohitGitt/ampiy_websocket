import 'package:ampiy/app/app.locator.dart';
import 'package:ampiy/services/api/webSocket.dart';
import 'dart:async';

import 'package:ampiy/services/easyLoading/easyLoadingService.dart';

class WebSocketService extends WebSocket {

  final _easyLoadingService = locator<EasyLoadingService>();

  StreamSubscription<dynamic>? subscription;
  
  
  WebSocketService(){
    connectToServer();
    startListeningToStream();
  }

  startListeningToStream() {
    subscription = socket?.stream.listen((message){});
  }

  void sendMessage(String message) {
    socket?.sink.add(message);
  }

  void removeListner(){
    subscription?.cancel();
  }

  void closeSocket() {
    socket?.sink.close();
  }


}
