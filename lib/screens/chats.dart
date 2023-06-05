import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsapp_clone/model/message.dart';
import 'package:whatsapp_clone/model/profile.dart';
import 'package:whatsapp_clone/shared/message_tile.dart';

class Chats extends StatefulWidget {
  Profile profile;
  Chats({required this.profile, super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  TextEditingController messageController = TextEditingController();
  StreamController<List<Message>> streamController = StreamController();
  List<Message> messages = [];

  void sendMessage(String message) {
    messages.add(Message(status: status.outgoing, body: message));
    streamController.add(messages);
    String copy = '';
    for (int i = message.length - 1; i >= 0; i--) {
      copy += message[i];
    }

    Future.delayed(Duration(seconds: 2), () {
      messages
          .add(Message(status: status.incoming, body: copy.capitaliseFirst));
      streamController.sink.add(messages);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: const [
          Icon(Icons.videocam),
          SizedBox(width: 15),
          Icon(Icons.call),
          SizedBox(width: 15),
          Icon(Icons.more_vert),
        ],
        titleSpacing: 2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: widget.profile.hashCode,
              child: CircleAvatar(
                backgroundImage: AssetImage(widget.profile.imgpath!),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(widget.profile.name!),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 32, 44, 51),
        elevation: 0,
      ),
      body: StreamBuilder(
          stream: streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: snapshot.data![index].status == status.incoming
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MessageTile(message: snapshot.data![index]),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: Text("No message yet"),
              );
            }
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          height: 7.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 85.w,
                child: TextField(
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                  controller: messageController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Message",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
                child: IconButton(
                  color: Colors.green,
                  icon: Icon(Icons.send),
                  onPressed: () {
                    sendMessage(messageController.text);
                    messageController.clear();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension on String {
  String get capitaliseFirst {
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
