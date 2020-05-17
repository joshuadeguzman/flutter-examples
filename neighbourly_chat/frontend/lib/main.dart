import 'dart:convert';

import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:frontend/model.dart';
import 'package:uuid/uuid.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  SocketIOManager manager;
  SocketOptions socketOptions;
  SocketIO socket;
  Uuid uuid;
  String myUuid;

  List<Message> messages;
  double height, width;
  TextEditingController textController;
  ScrollController scrollController;

  _setup() async {
    manager = SocketIOManager();
    socketOptions = SocketOptions(
      // You may also consider using .env setup for this
      // Testing locally
      // 'http://192.168.1.10:8080/',
      // Testing servers uploaded in the cloud
      'https://neighbourly-chat.herokuapp.com/',
      enableLogging: false,
      transports: [
        Transports.WEB_SOCKET,
      ],
    );
    socket = await manager.createInstance(socketOptions);

    socket.onConnect((data) {
      debugPrint('socket => connected');
      debugPrint('socket data => $data');
    });
    socket.on('receive_message', (data) {
      final message = Message.fromJson(data);
      setState(() => messages.add(message));

      // Show the last item added to the list
      // https://stackoverflow.com/questions/44141148/how-to-get-full-size-of-a-scrollcontroller
      SchedulerBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    });
    socket.connect();
  }

  @override
  void initState() {
    messages = List<Message>();
    textController = TextEditingController();
    scrollController = ScrollController();

    // Setup uuid
    // TODO: Can soon be considered as auth
    // Generates unique uuid
    uuid = Uuid();
    myUuid = uuid.v4();

    // Setup websockets
    _setup();
    super.initState();
  }

  // You may also consider creating this in a separate widget
  Widget buildSentMessageView(int index) {
    return Container(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 16, right: 16),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          messages[index].message,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget buildReceivedMessageView(int index) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 16, left: 16),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          messages[index].message,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget buildMessageList() {
    return Container(
      height: height * 0.75,
      width: width,
      child: ListView.builder(
        controller: scrollController,
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          // Using uuid, which is saved locally in memory
          // Check whether the message received from the server is his/her own
          // Otherwise, show a received message view
          if (messages[index].uuid == myUuid) {
            return buildSentMessageView(index);
          } else {
            return buildReceivedMessageView(index);
          }
        },
      ),
    );
  }

  Widget buildChatInputView() {
    return Container(
      width: width * 0.7,
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(left: 40.0),
      child: TextField(
        decoration: InputDecoration.collapsed(
          hintText: 'Send a message...',
        ),
        controller: textController,
      ),
    );
  }

  Widget buildSendButtonView() {
    return FloatingActionButton(
      backgroundColor: Colors.blueAccent,
      onPressed: () {
        if (textController.text.isNotEmpty) {
          // Broadcast message to the server
          final message = Message(uuid: myUuid, message: textController.text);
          socket.emitWithAck('send_message', [json.encode(message)]).then(
            (data) {
              debugPrint('sent message => $data');

              setState(() => messages.add(message));
            },
          );

          // Reset user's message input
          textController.text = '';
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 600),
            curve: Curves.ease,
          );
        }
      },
      child: Icon(
        Icons.send,
        size: 30,
      ),
    );
  }

  Color getBackgroundColor() {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Neighbourly Chat'),
        ),
        backgroundColor: getBackgroundColor(),
        body: Container(
          padding: const EdgeInsets.only(bottom: 16),
          height: height,
          width: width,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: buildMessageList(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: getBackgroundColor(),
                  padding: const EdgeInsets.only(top: 8),
                  height: 54,
                  width: width,
                  child: Row(
                    children: <Widget>[
                      buildChatInputView(),
                      buildSendButtonView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
