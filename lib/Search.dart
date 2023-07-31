import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testwheren/UpcomingEvent.dart';
import 'main.dart';
import 'MySettings.dart';
import 'MyProfile.dart';
import 'PastEvent.dart';
import 'MyUpdates.dart';
import 'MyEvents.dart';
import 'LiveEventView.dart';
import 'globals.dart' as globals;

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
        bottom: PreferredSize(
            child: Container(
              color: Colors.black,
              height: 0.25,
            ),
            preferredSize: Size.fromHeight(0.25)),
      ),
      //body: ,
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> getList() {
    List<String> searchTerms = [];
    for (int i = 0; i < globals.allevents.length; i++) {
      searchTerms.add(globals.allevents[i].OnomaEvent);
    }
    return searchTerms;
  }

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var events in getList()) {
      if (events.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(events);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var events in getList()) {
      if (events.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(events);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
            title: Text(result),
            onTap: () {
              if (DateTime.now()
                  .isBefore(globals.allevents[index].hmeromhnia)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PastEvent(event: globals.allevents[index])));
              } else if (DateTime.now().isAfter(globals
                  .allevents[index].hmeromhnia
                  .add(globals.allevents[index].diarkeia))) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LiveEventView(event: globals.allevents[index])));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UpcomingEvent(event: globals.allevents[index])));
              }
            });
      },
    );
  }
}
