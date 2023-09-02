import 'package:socket_io_client/socket_io_client.dart' as IO;

class TicketSocket {
  late IO.Socket socket;
  TicketSocket() {
    initSocket();
  }
  initSocket() {
    print('hello world');
    socket = IO.io('http://10.0.2.2:4000/', <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
      print(socket.connected);
      socket.emit(
        '/message',
      );
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
    ;
  }
}
