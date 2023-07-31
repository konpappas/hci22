import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //Χρειαζεται για CreateEvent
import 'MySettings.dart';
import 'MyProfile.dart';
import 'PastEvent.dart';
import 'MyUpdates.dart';
import 'MyEvents.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key, required this.title});

  final String title;

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
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
            'An account is required to\n      use College Nights',
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
                  'Create Account',
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
                'Already have an account?',
                style: TextStyle(color: Colors.black),
              ),
              TextButton(
                  onPressed: (() {
                    //
                  }),
                  child: Text('Sign in',
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
