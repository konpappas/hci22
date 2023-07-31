import 'package:flutter/material.dart';

class Levels extends StatelessWidget {
  const Levels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Levels'),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.25),
            child: Container(
              color: Colors.black,
              height: 0.25,
            )),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Level 0'),
            subtitle: Text('You can attend available events.'),
          ),
          Divider(),
          ListTile(
            title: Text('Level 1'),
            subtitle:
                Text('You can post stories from events you are attending'),
          ),
          Divider(),
          ListTile(
            title: Text('Level 2'),
            subtitle: Text(
                'You can now upload reviews from events you have attended.'),
          ),
          Divider(),
          ListTile(
            title: Text('Level 3'),
            subtitle: Text(
                "You can organize your own events and post them to the app's frontpage."),
          ),
        ],
      ),
    );
  }
}
