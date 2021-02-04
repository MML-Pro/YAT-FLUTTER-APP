import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class firestoreDB extends StatefulWidget {
  @override
  _firestoreDBState createState() => _firestoreDBState();
}

class _firestoreDBState extends State<firestoreDB> {

  CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firestore DB'),),

      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            RaisedButton(child: Text('Save data'),onPressed: ()=>{

              usersCollection.add({'index ' : '1' , 'about' :
              'jahgbdgjkhdbgkhjdg' , 'name' : 'Mohammed' ,
                'picture' : 'https://randomuser.me/api/portraits/men/'
                , 'company' : 'Google' , 'email' : 'mml@gmail.com'})

            }),

            Container(
             height: 300,
             child: FutureBuilder(
               future: usersCollection.doc('UUk2LNQpQ6DysDDaCTzj').get(),
               builder: (context, AsyncSnapshot<DocumentSnapshot> documentSnapshot ){

                 if(documentSnapshot.connectionState == ConnectionState.done){

                   Map data = documentSnapshot.data.data();
                   return ListTile(

                     title: Text(data['name']),
                     subtitle: Text(data['email']),

                   );
                 }

                 return ListTile(
                   title: Text('Loading...'),

                 );

               },

             ),

            )

          ],

        ),




      ),
    );
  }
}
