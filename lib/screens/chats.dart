import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsapp_clone/consts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String time = "${DateTime.now().hour} : ${DateTime.now().minute}";
    String symbol = DateTime.now().hour < 12 ? "am" : "pm";
    return Scaffold(
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(profiles[index].imgpath!),
            ),
            title: Text(
              profiles[index].name!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Hello I'm ${profiles[index].name}",
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "$time ${symbol.toUpperCase()}",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12.sp,
                  ),
                ),
                const Badge(
                  backgroundColor: Color.fromARGB(255, 0, 168, 132),
                  label: Text("3"),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 168, 132),
        onPressed: () {},
        child: const Icon(Icons.message),
      ),
    );
  }
}
