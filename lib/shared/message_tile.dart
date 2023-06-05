import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsapp_clone/model/message.dart';

class MessageTile extends StatelessWidget {
  Message message;
  MessageTile({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 50.w,
      decoration: BoxDecoration(
        color: message.status == status.outgoing
            ? const Color.fromARGB(255, 0, 168, 132)
            : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        message.body!,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
