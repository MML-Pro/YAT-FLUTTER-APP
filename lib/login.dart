import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String emailAddress = '';
  String password = '';
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Login Screen'
        ),

      ),
      body: Container(
        child: Column(
          children: [
            Text('Login'),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(labelText: 'Enter your email' , labelStyle: TextStyle(
                  color: Colors.teal[100], fontSize: 20 , fontWeight: FontWeight.bold)),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value){
                emailAddress = value.trim();
              },


            ),


            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Password' ,
                  hintText: 'Enter your password',
                  labelStyle: TextStyle(
                      color: Colors.teal[100], fontSize: 20 , fontWeight: FontWeight.bold)),
              textInputAction: TextInputAction.done,
              obscureText: true,
              onChanged: (value){
                password= value.trim();
              },
            ),
            SizedBox(height: 5,),
            RaisedButton(
                child: Text('Login user'
                , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),onPressed: () async{

              try {
                final newuser = await firebaseAuth.
                              signInWithEmailAndPassword(email: emailAddress, password: password);

                if(newuser != null){
                  controller.clear();
                                Navigator.pushNamed(context, 'services');
                              }
              } catch (e) {
                print(e);
              }

            }),


          ],

        ),

      ),

    );
  }
}
