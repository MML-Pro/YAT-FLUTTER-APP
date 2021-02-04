import 'package:flutter/material.dart';
import 'package:yat_flutter_app/signup.dart';
import 'firestoreDB.dart';
import 'home.dart';
import 'login.dart';
import 'usersList.dart';


void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        'login' : (context)=>loginScreen(),
        'signUp' : (context)=>signUpScreen(),
        'usersList' : (context)=> usersList(),
        'firestoreDB': (context)=>firestoreDB(),
      },

    );
  }
}


