import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:testwheren/UpcomingEvent.dart';
import 'MyProfile.dart';
import 'LiveEventView.dart';
import 'CreateEvent.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showLive = false;
  late List<Event> viewnowlist;
  List<Event> liveeventslist = <Event>[];
  @override
  Widget build(BuildContext context) {
    liveeventslist = [];
    for (int i = 0; i < globals.allevents.length; i++) {
      if (DateTime.now().isAfter(globals.allevents[i].hmeromhnia) &&
          DateTime.now().isBefore(globals.allevents[i].hmeromhnia
              .add(globals.allevents[i].diarkeia))) {
        globals.allevents[i].live = true;
        liveeventslist.add(globals.allevents[i]);
      } else {
        globals.allevents[i].live = false;
      }
    }
    viewnowlist = (!showLive) ? globals.allevents : liveeventslist;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('College Nights'),
          leading: IconButton(
              icon: (!showLive)
                  ? const Icon(Icons.radio_button_unchecked)
                  : const Icon(
                      Icons.radio_button_checked_outlined,
                      color: Color.fromARGB(255, 179, 38, 30),
                    ),
              onPressed: () => setState(() {
                    showLive = !showLive;
                  })),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfile()));
                },
                icon: const Icon(Icons.account_circle_rounded))
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.25),
              child: Container(
                color: Colors.black,
                height: 0.25,
              )),
        ),
        body: ListView.builder(
            itemCount: viewnowlist.length,
            itemBuilder: ((context, index) {
              return Container(
                margin: const EdgeInsets.only(
                    left: 12, right: 12, bottom: 20, top: 15),
                child: InkWell(
                  onTap: () {
                    if (!viewnowlist[index].live) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UpcomingEvent(event: viewnowlist[index])));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LiveEventView(event: viewnowlist[index])));
                    }
                  },
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                const Color.fromARGB(255, 234, 221, 255),
                            child: Text(
                                '${viewnowlist[index].OnomaDiorganwti[0]}${viewnowlist[index].EpithetoDiorganwti[0]}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 33, 0, 93))),
                          ),
                          trailing: (viewnowlist[index].live)
                              ? const Icon(
                                  Icons.radio_button_checked,
                                  color: Color.fromARGB(255, 179, 38, 30),
                                )
                              : null,
                          title: Text(
                              '${viewnowlist[index].OnomaDiorganwti} ${viewnowlist[index].EpithetoDiorganwti}'),
                          subtitle: Text(
                            viewnowlist[index].meros,
                          ),
                        ),
                        AspectRatio(
                            aspectRatio: 335 / 170,
                            child: Image.asset(
                              viewnowlist[index].eikona,
                              fit: BoxFit.fitWidth,
                            )),
                        ListTile(
                          title: Text(
                            viewnowlist[index].OnomaEvent,
                          ),
                          subtitle: Text(DateFormat('EEEE, d MMM yyyy HH:mm')
                              .format(viewnowlist[index].hmeromhnia)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            viewnowlist[index].perigrafh,
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                viewnowlist.removeAt(index);
                                setState(() {});
                              },
                              child: const Text('Not Interested'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 103, 80, 164)),
                              onPressed: () {
                                globals.myeventslist.add(viewnowlist[index]);
                                viewnowlist.removeAt(index);
                                globals.progress(.1);
                                setState(() {});
                              },
                              child: const Text('Attend',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })),
        floatingActionButton: (globals.level >= 3)
            ? FloatingActionButton(
                onPressed: () async {
                  Event? newEvent = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateEvent()));
                  if (newEvent != null) {
                    globals.progress(.4);
                    globals.myeventslist.add(newEvent);
                  }
                  setState(() {});
                },
                child: const Icon(Icons.add))
            : null);
  }
}
