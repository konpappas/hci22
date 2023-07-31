import 'dart:io';
import 'package:testwheren/MyUpdates.dart';
import 'Search.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'MyProfile.dart';
import 'Levels.dart';
import 'MyEvents.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  bool light = true;

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
              preferredSize: Size.fromHeight(0.25),
              child: Container(
                color: Colors.black,
                height: 0.25,
              )),
        ),
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListTile(
                title: const Text(
                  'Notifications',
                  style: TextStyle(fontSize: 22),
                ),
                subtitle: null,
                leading: Icon(
                  Icons.notifications_outlined,
                  color: Colors.grey.shade700,
                  size: 30,
                ),
                trailing: Switch(
                  // This bool value toggles the switch.
                  value: light,

                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      light = value;
                    });
                  },
                )),
            Divider(),
            ListTile(
              title: Text(
                'Levels',
                style: TextStyle(fontSize: 22),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Levels())),
              leading: Icon(
                Icons.person_outlined,
                color: Colors.grey.shade700,
                size: 30,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Delete Account',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.delete,
                color: Colors.grey.shade700,
                size: 30,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Log Out',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.grey.shade700,
                size: 30,
              ),
            )
          ],
        ));
  }
}
