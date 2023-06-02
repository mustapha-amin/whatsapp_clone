import 'package:flutter/material.dart';
import 'package:whatsapp_clone/consts.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 0, 168, 132),
            child: Icon(Icons.link),
          ),
          title: Text(
            "Create call link",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "Share a link for your whatsapp call",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "Recent",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        ...List.generate(
          6,
          (index) => ListTile(
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
            subtitle: Row(
              children: [
                Icon(
                  Icons.arrow_outward,
                  color: index % 2 == 0
                      ? const Color.fromARGB(255, 184, 76, 90)
                      : const Color.fromARGB(255, 0, 168, 132),
                  size: 17,
                ),
                const Text(
                  "Yeserday, 10:23 PM",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            trailing: const Icon(
              Icons.call,
              color: Color.fromARGB(255, 0, 168, 132),
            ),
          ),
        )
      ],
    );
  }
}
