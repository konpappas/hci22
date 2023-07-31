import 'dart:io';
import 'package:flutter/material.dart';
import 'MySettings.dart';
import 'globals.dart' as globals;

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String FirstName = globals.firtname;
  String LastName = globals.lastname;

  final _textController = TextEditingController();
  String newName = "Mpampis Sougias";
  List<String> FullName = ['No', 'Name'];
  bool NameChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            centerTitle: true,
            title: NameChange ? nameChanger() : profileName(),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      NameChange = true;
                    });
                  },
                  icon: const Icon(Icons.mode_edit_outline_outlined))
            ],
          ),
        ),
        body: ListView(children: [
          ListTile(title: Center(child: profilePictureSolid())),
          ListTile(
              contentPadding: const EdgeInsets.only(left: 18.0, right: 18),
              title: Text("Lvl.${globals.level}",
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 33, 0, 93))),
              trailing: CircularProgressIndicator(value: globals.progression)),
          const ListTile(
            contentPadding: EdgeInsets.only(left: 18.0, right: 18),
            title: Text(
              'Events Attended',
              style: TextStyle(fontSize: 22),
            ),
            trailing: Text(
              '14',
              style: TextStyle(fontSize: 22),
            ),
          ),
          const ListTile(
            contentPadding: EdgeInsets.only(left: 18.0, right: 18),
            title: Text(
              'Stories Uploaded',
              style: TextStyle(fontSize: 22),
            ),
            trailing: Text(
              '14',
              style: TextStyle(fontSize: 22),
            ),
          ),
          const ListTile(
            contentPadding: EdgeInsets.only(left: 18.0, right: 18),
            title: Text(
              'Reviews Posted',
              style: TextStyle(fontSize: 22),
            ),
            trailing: Text(
              '3',
              style: TextStyle(fontSize: 22),
            ),
          ),
          const ListTile(
            contentPadding: EdgeInsets.only(left: 18.0, right: 18),
            title: Text(
              'QR Codes Found',
              style: TextStyle(fontSize: 22),
            ),
            trailing: Text(
              '6',
              style: TextStyle(fontSize: 22),
            ),
          )
        ]));
  }

  Widget profileName() => RichText(
        text: TextSpan(
            text: FirstName,
            style: const TextStyle(fontSize: 24, color: Colors.black),
            children: [
              const TextSpan(
                text: " ",
              ),
              TextSpan(
                  text: LastName,
                  style: const TextStyle(fontSize: 24, color: Colors.black))
            ]),
      );

  Widget profilePictureSolid() => Stack(
        children: [
          Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.purple.shade800, shape: BoxShape.circle),
              child: Stack(children: [
                Center(
                  child: RichText(
                      text: TextSpan(
                          text: FirstName[0],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 40),
                          children: [
                        TextSpan(
                            text: LastName[0],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 40))
                      ])),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                        color: Colors.purple.shade100),
                    child: IconButton(
                        iconSize: 27.0,
                        onPressed: () {
                          setState(() {
                            //edit picture
                          });
                        },
                        icon: const Icon(Icons.mode_edit_outline_outlined,
                            color: Colors.black)),
                  ),
                )
              ])),
        ],
      );

  Widget nameChanger() => Column(
        children: [
          TextField(
            controller: _textController,
            decoration: InputDecoration(
                hintText: 'Example: Dimitrios *space* Dimitriou',
                border: InputBorder.none,
                suffixIcon: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // added line
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          newName = _textController.text;
                          final savedName = newName.split(' ');
                          FullName[0] = savedName[0];
                          FullName[1] = savedName[1];

                          FullName[0].isEmpty
                              ? FirstName = '_'
                              : FirstName = FullName[0];
                          FullName[1].isEmpty
                              ? LastName = '_'
                              : LastName = FullName[1];
                          globals.firtname = FirstName;
                          globals.lastname = LastName;
                          NameChange = false;
                        });
                      },
                      icon: const Icon(Icons.save_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        _textController.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ],
                )),
          ),
        ],
      );

/*
  Widget profileDetails() => ListView(children: [
        ListTile(
            title: RichText(
                text: TextSpan(
                    text: 'Events Attended',
                    style:
                        TextStyle(color: Colors.purple.shade900, fontSize: 28),
                    children: [
              TextSpan(text: "   "),
              TextSpan(
                  text: '5',
                  style: TextStyle(color: Colors.purple.shade900, fontSize: 28))
            ]))),
        ListTile(
            title: RichText(
                text: TextSpan(
                    text: 'Stories Uploaded',
                    style:
                        TextStyle(color: Colors.purple.shade900, fontSize: 28),
                    children: [
              TextSpan(text: "  "),
              TextSpan(
                  text: '14',
                  style: TextStyle(color: Colors.purple.shade900, fontSize: 28))
            ]))),
        ListTile(
            title: RichText(
                text: TextSpan(
                    text: 'Reviews Posted',
                    style:
                        TextStyle(color: Colors.purple.shade900, fontSize: 28),
                    children: [
              TextSpan(text: "    "),
              TextSpan(
                  text: '3',
                  style: TextStyle(color: Colors.purple.shade900, fontSize: 28))
            ]))),
        ListTile(
          title: RichText(
              text: TextSpan(
                  text: 'QR Codes Found',
                  style: TextStyle(color: Colors.purple.shade900, fontSize: 28),
                  children: [
                TextSpan(text: "  "),
                TextSpan(
                    text: '9',
                    style:
                        TextStyle(color: Colors.purple.shade900, fontSize: 28))
              ])),
        )
      ]);

      */
}
