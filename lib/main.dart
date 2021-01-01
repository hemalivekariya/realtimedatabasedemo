import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyActivity(),
    );
  }
}

class MyActivity extends StatefulWidget {
  @override
  _MyActivityState createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  create() {
    databaseReference.child("UserDataStore").set({
      "name": 'Hemali',
      "job": "flutter",
      'hobies': ["dancing", 'bikeRiding', 'typing'],
      'friendMap':{
        'clgfriend':["divya","rc","krupa"],
        'schoolFriend':['rc','sima','bhumi']
      }
    });
    databaseReference.child("UserData").set({
      "name": 'Hemali',
      "job": "flutter",
    });
    databaseReference.child("UserData").set({
      "name": 'Hemali',
      "job": "flutter",
    });
  }
  getData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print("Data------>${snapshot.value} \n ");
    });
  }
updateData(){
    databaseReference.child("UserDataStore").update({'job':'IOS'});
    print("Updated data ");
    getData();
}
  deleteData(){
    databaseReference.child("UserDataStore").remove();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                create();
              },
              child: Text("Create data"),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                getData();
              },
              child: Text("Read/View data"),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: FlatButton(
              color: Colors.yellow,
              onPressed: () {
                updateData();
              },
              child: Text("Update data"),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
deleteData();
              },
              child: Text("Delete data"),
            ),
          ),
        ],
      ),
    );
  }
}
