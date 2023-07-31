import 'dart:io';
import 'package:flutter/material.dart';
import 'MyEvents.dart';
import 'MyUpdates.dart';
import 'CreateEvent.dart';
import 'main.dart';
import 'package:intl/intl.dart';

class UpcomingEvent extends StatefulWidget {
  final Event event;

  const UpcomingEvent({super.key, required this.event});

  @override
  State<UpcomingEvent> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.event.OnomaEvent),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 234, 221, 255),
                child: Text(
                    '${widget.event.OnomaDiorganwti[0]}${widget.event.EpithetoDiorganwti[0]}',
                    style: TextStyle(color: Color.fromARGB(255, 33, 0, 93))),
              ),
            )
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.25),
              child: Container(
                color: Colors.black,
                height: 0.25,
              )),
        ),
        body: Column(
          children: [
            AspectRatio(
                aspectRatio: 335 / 170,
                child: Image.asset(
                  widget.event.eikona,
                  fit: BoxFit.fitWidth,
                )),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text(widget.event.meros),
                      subtitle: Text(DateFormat('EEEE, d MMM yyyy HH:mm')
                          .format(widget.event.hmeromhnia)))
                ],
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('180'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(widget.event.perigrafh),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Not Interested'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 103, 80, 164)),
                  onPressed: () {},
                  child: const Text('Attend',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                ),
              ],
            )
          ],
        ));
  }
}
