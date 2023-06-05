import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsapp_clone/screens/calls.dart';
import 'package:whatsapp_clone/screens/chats_list.dart';
import 'package:whatsapp_clone/screens/settings.dart';
import 'package:whatsapp_clone/screens/status.dart';

void main() {
  runApp(Sizer(
    builder: (context, _, __) {
      return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 17, 27, 33),
        ),
        home: Home(),
        debugShowCheckedModeBanner: false,
      );
    },
  ));
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: DefaultTabController(
        animationDuration: Duration(milliseconds: 300),
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: const Color.fromARGB(255, 32, 44, 51),
                expandedHeight: size.height / 5,
                floating: true,
                pinned: true,
                title: const Text(
                  "WhatsApp",
                  style: TextStyle(color: Colors.grey, fontSize: 27),
                ),
                actions: [
                  const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  PopupMenuButton<String>(
                    color: const Color.fromARGB(255, 32, 44, 51),
                    icon: const Icon(
                      Icons.more_vert_sharp,
                      color: Colors.grey,
                    ),
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                            child: Text(
                          "New group",
                          style: TextStyle(color: Colors.white),
                        )),
                        const PopupMenuItem(
                          child: Text(
                            "New broadcast",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const PopupMenuItem(
                          child: Text(
                            "Linked devices",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const PopupMenuItem(
                          child: Text(
                            "Starred messages",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () async {
                            await Future.delayed(Duration.zero);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const Settings();
                            }));
                          },
                          child: const Text(
                            "Settings",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ];
                    },
                  )
                ],
                bottom: const TabBar(
                  indicatorColor: Color.fromARGB(255, 0, 168, 132),
                  tabs: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Tab(
                          text: "Chats",
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Badge(
                          label: Text("23"),
                          textColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 0, 168, 132),
                        )
                      ],
                    ),
                    Tab(
                      text: "Status",
                    ),
                    Tab(
                      text: "Calls",
                    )
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              ChatList(),
              Status(),
              CallsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
