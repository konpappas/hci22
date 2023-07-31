import 'package:flutter/material.dart';
import 'MySettings.dart';
import 'PastEvent.dart';
import 'LiveEventView.dart';
import 'MyUpdates.dart';
import 'MyEvents.dart';
import 'Search.dart';
import 'HomePage.dart';

void main() {
  runApp(const wheren());
}

class wheren extends StatelessWidget {
  const wheren({super.key});

  /// Μέθοδος που κατασκευάζει το [Widget] της εφαρμογής μας
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Τίτλος της εφαρμογής μας
      title: 'College Nights',

      /// Το θέμα της εφαμρογής μας
      theme: ThemeData(
        applyElevationOverlayColor: true,
        colorSchemeSeed: const Color.fromRGBO(103, 80, 164, 1),
        useMaterial3: true,
        timePickerTheme: TimePickerThemeData(
          backgroundColor: Colors.purple.shade50,
          helpTextStyle: const TextStyle(fontSize: 14),
        ),
      ),

      /// Αρχικοποίηση της κεντρικής οθόνης της εφαρμογής μας (TaskListScreen)
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> pageList = [
    const HomePage(),
    const Search(),
    const MyEvents(),
    const MyUpdates(),
    const MySettings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_outline), label: 'My Events'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined), label: 'Updates'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Settings')
          ]),
    );
  }
}

class Event {
  final String OnomaEvent;
  final String OnomaDiorganwti;
  final String EpithetoDiorganwti;
  final String meros;
  final DateTime hmeromhnia;
  final Duration diarkeia;
  final String perigrafh;
  final String eikona;
  double rating;
  bool live;
  List<Review> reviews = <Review>[
    Review(
      Fname: 'Kostantinos',
      Lname: 'Christakis',
      revText: 'Supporting line text lorem ipsum dolor sit amet, consectetur',
      score: 4,
    )
  ];
  List<LiveComment> feedback = <LiveComment>[
    LiveComment(
        commentBody: "Εδώ περνάμε καλά :D",
        UploadTime: const TimeOfDay(hour: 20, minute: 32),
        FirstName: "Kyriakh",
        LastName: "Pantelopoulou"),
    LiveComment(
        commentBody: "Τελειωσαν τα ποτα!",
        UploadTime: const TimeOfDay(hour: 21, minute: 03),
        FirstName: "Γιώργος",
        LastName: "Καραγιώργος"),
    LiveComment(
        commentBody: "Έφερα ποτά!!",
        UploadTime: const TimeOfDay(hour: 21, minute: 10),
        FirstName: "xXPotoFertisXx",
        LastName: "_"),
  ];
  List<Story> stories = [];
  Event(
      {required this.OnomaEvent,
      required this.OnomaDiorganwti,
      required this.EpithetoDiorganwti,
      required this.meros,
      required this.hmeromhnia,
      required this.diarkeia,
      required this.perigrafh,
      this.eikona = './assets/images/Media.png',
      this.live = false,
      this.rating = 4});
}
