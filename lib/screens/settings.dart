import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsapp_clone/consts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 32, 44, 51),
        title: const Text("Settings"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30.w,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width / 9,
                        backgroundImage: AssetImage(profiles[0].imgpath!),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Anonymous",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "alive ? code() : code()",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.sp),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.qr_code_outlined,
                    color: Color.fromARGB(255, 0, 168, 132),
                  )
                ],
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.key, color: Colors.grey),
            title: Text(
              "Accounts",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "Security notifications, change number",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.lock, color: Colors.grey),
            title: Text("privacy", style: TextStyle(color: Colors.white)),
            subtitle: Text("Block contacts, disppearing messages",
                style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
            leading: Icon(Icons.emoji_emotions_sharp, color: Colors.grey),
            title: Text("Avatar", style: TextStyle(color: Colors.white)),
            subtitle: Text("Create, edit, profile photo",
                style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
            leading: Icon(Icons.chat, color: Colors.grey),
            title: Text("Chat", style: TextStyle(color: Colors.white)),
            subtitle: Text("Theme, wallpapers, chat history",
                style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
            leading: Icon(Icons.notifications, color: Colors.grey),
            title: Text("Notifications", style: TextStyle(color: Colors.white)),
            subtitle: Text("Message, group & call notes",
                style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
            leading: Icon(Icons.pie_chart_outline_sharp, color: Colors.grey),
            title:
                Text("Storage and data", style: TextStyle(color: Colors.white)),
            subtitle: Text("Network usage, auto-download",
                style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
            leading: Icon(Icons.language, color: Colors.grey),
            title: Text("App language", style: TextStyle(color: Colors.white)),
            subtitle: Text("English (phone's language)",
                style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
            leading: Icon(Icons.help_outline, color: Colors.grey),
            title: Text("Help", style: TextStyle(color: Colors.white)),
            subtitle: Text("Help center, contact us, privacy policy",
                style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
            leading: Icon(Icons.people, color: Colors.grey),
            title: Text(
              "Invite a friend",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
