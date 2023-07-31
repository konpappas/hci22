import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testwheren/MyEvents.dart';
import 'MyProfile.dart';
import 'main.dart';
import 'MySettings.dart';
import 'PastEvent.dart';
import 'Search.dart';
import 'globals.dart' as globals;

class MyUpdates extends StatelessWidget {
  const MyUpdates({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('College Nights'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyProfile()));
              },
              icon: const Icon(Icons.account_circle_rounded))
        ],
        bottom: PreferredSize(
            child: Container(
              color: Colors.black,
              height: 0.25,
            ),
            preferredSize: Size.fromHeight(0.25)),
      ),
      body: ListView(children: const <Notification>[
        Notification(
          periexomeno: ('Time has changed. Take a look!'),
          NotPic: ('./assets/images/Media.png'),
        ),
        Notification(
            periexomeno: 'Cool', NotPic: ('./assets/images/festival.jpg')),
        Notification(
            periexomeno: ('periexomeno'), NotPic: ('./assets/images/Media.png'))
      ]),
    );
  }
}

class Notification extends StatefulWidget {
  final String periexomeno;
  final String NotPic;

  const Notification(
      {Key? key, required this.periexomeno, required this.NotPic})
      : super(key: key);

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: InkWell(
                splashColor: Color.fromARGB(255, 166, 33, 243).withAlpha(30),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PastEvent(
                              event: globals.allevents[0],
                            ))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: Text(widget.periexomeno),
                        trailing: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(widget.NotPic),
                        ))
                  ],
                ))));
  }
}
