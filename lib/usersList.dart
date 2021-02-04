import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class usersList extends StatefulWidget {
  @override
  _usersListState createState() => _usersListState();
}

class _usersListState extends State<usersList> {
  Future<List<User>> _getUsers() async {
    var data = await http
        .get("https://www.json-generator.com/api/json/get/bYKKPeXRcO?indent=2");
    var jasonData = json.decode(data.body);
    List<User> users = [];

    for (var i in jasonData) {
      User user = User(i["index"], i["about"], i["name"], i["picture"],
          i["company"], i["email"]);
      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
       children: [
             FutureBuilder(
               future: _getUsers(),
               builder: (BuildContext context, AsyncSnapshot asyncSnapshop) {
                 if (asyncSnapshop.hasData) {
                   return Expanded(
                     child: ListView.builder(
                       shrinkWrap: true,
                         itemCount: asyncSnapshop.data.length,
                         itemBuilder: (BuildContext context, int index) {
                           return Card(
                             elevation: 5,
                             color: Colors.cyan[50],
                             child: ListTile(
                               trailing: Icon(Icons.share),
                               title: Text(asyncSnapshop.data[index].name, style: TextStyle(fontFamily: 'Tahoma',fontSize: 20,fontWeight: FontWeight.bold),),
                               leading: CircleAvatar(
                                 backgroundImage: NetworkImage(
                                     asyncSnapshop.data[index].picture +
                                         asyncSnapshop.data[index].index.toString() +
                                         ".jpg"),
                               ),
                               subtitle: Text(asyncSnapshop.data[index].email,style: TextStyle(fontFamily: 'Tahmoma',fontSize: 18),),
                               onTap: (){
                                 Navigator.push(context, new MaterialPageRoute(builder: (context)=>
                                     detailsPage(asyncSnapshop.data[index])
                                 ));
                               },

                               onLongPress: ()=>

                               Fluttertoast.showToast(
                               msg: asyncSnapshop.data[index].name,
                               toastLength: Toast.LENGTH_SHORT,
                               gravity: ToastGravity.CENTER,
                               timeInSecForIosWeb: 1,
                               backgroundColor: Colors.green[900],
                               textColor: Colors.white,
                               fontSize: 16.0
                               ),

                             ),
                           );
                         }),
                   );
                 } else {
                   return Text("Loading, please wait...");
                 }
               },
         ),
       ],

      ),
    );
  }
}

class User {
  final int index;
  final String about;
  final String name;
  final String picture;
  final String company;
  final String email;

  User(this.index, this.about, this.name, this.picture, this.company,
      this.email);
}

class detailsPage extends StatelessWidget {
  final User user;

  detailsPage(this.user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Center(
          child: Text(this.user.about, style: TextStyle(fontFamily: 'Tahoma', fontSize: 20, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }


}
