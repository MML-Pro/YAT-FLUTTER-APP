import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yat Flutter App',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tahoma')),
      ),
      body: Column(
        children: [
          Center(
            child: OutlinedButton(
              child: Text('Login Screen',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                overlayColor: MaterialStateProperty.all<Color>(Colors.orange),
                elevation: MaterialStateProperty.all<double>(6.0),
                shadowColor: MaterialStateProperty.all<Color>(Colors.pink),
              ),
            ),
          ),
          Center(
            child: OutlinedButton(
              child: Text('Signup Screen',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pushNamed(context, 'signUp');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                overlayColor: MaterialStateProperty.all<Color>(Colors.orange),
                elevation: MaterialStateProperty.all<double>(6.0),
                shadowColor: MaterialStateProperty.all<Color>(Colors.pink),
              ),
            ),
          ),
          Center(
            child: OutlinedButton(
                child: Text('Users List',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.orange),
                  elevation: MaterialStateProperty.all<double>(6.0),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.pink),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'usersList');
                }),
          ),

          Center(
            child: OutlinedButton(
                child: Text('FireStore DB',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.teal),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.orange),
                  elevation: MaterialStateProperty.all<double>(6.0),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.pink),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'firestoreDB');
                }),
          ),
        ],
      ),
    );
  }
}
