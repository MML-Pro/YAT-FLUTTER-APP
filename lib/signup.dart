import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signUpScreen extends StatefulWidget {
  @override
  _signUpScreenState createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  String email = '';
  String password = '';
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registration',
          style: TextStyle(
              fontSize: 20, fontFamily: 'Tahoma', fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text('SignUp'),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Enter your email',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value.trim();
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                textInputAction: TextInputAction.done,
                obscureText: true,
                onChanged: (value) {
                  password = value.trim();
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            OutlinedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.orange),
                  elevation: MaterialStateProperty.all<double>(5.0),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.yellow),
                ),
                child: Text('Create user', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  final newuser =
                      await firebaseAuth.createUserWithEmailAndPassword(
                          email: email, password: password);

                  if (newuser != null) {}
                }),
          ],
        ),
      ),
    );
  }
}
