import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //Χρειαζεται για CreateEvent
import 'MySettings.dart';
import 'MyProfile.dart';
import 'PastEvent.dart';
import 'MyUpdates.dart';
import 'MyEvents.dart';

void main() {
  runApp(const MySignInPage());
}

class MySignInPage extends StatelessWidget {
  const MySignInPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignInPage',
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const MyHomePage(title: 'Sign In'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 48, color: Colors.purple.shade900),
        ),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 5,
          ),
          Text(
            'Sign in to use College Nights!',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 380,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Email Address',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 380,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(
                color: Colors.purple.shade900.withOpacity(0.75),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: TextButton(
                onPressed: () {
                  //
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New to College Nights?',
                style: TextStyle(color: Colors.black),
              ),
              TextButton(
                  onPressed: (() {
                    //
                  }),
                  child: Text('Create an Account Now!',
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline)))
            ],
          )
        ]),
      ),
    );
  }
}
