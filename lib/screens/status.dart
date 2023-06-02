import 'package:flutter/material.dart';
import 'package:whatsapp_clone/consts.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Container(
            width: MediaQuery.of(context).size.width / 6.5,
            height: MediaQuery.of(context).size.width / 6.5,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                style: BorderStyle.solid,
                color: const Color.fromARGB(255, 0, 168, 132),
              ),
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(profiles[0].imgpath!)),
            ),
          ),
          title: const Text(
            "My status",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            "Today, 4:34 PM",
            style: TextStyle(color: Colors.grey),
          ),
          trailing: RotatedBox(
            quarterTurns: 1,
            child: PopupMenuButton(
              color: Colors.grey,
              itemBuilder: (context) {
                return [];
              },
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "Recent updates",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        ...List.generate(
          8,
          (index) => ListTile(
            leading: Container(
              width: MediaQuery.of(context).size.width / 6.5,
              height: MediaQuery.of(context).size.width / 6.5,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  style: BorderStyle.solid,
                  color: const Color.fromARGB(255, 0, 168, 132),
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(profiles[index].imgpath!)),
              ),
            ),
            title: Text(
              profiles[index].name!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: const Text(
              "Today, 12:45 Am",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
