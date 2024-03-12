import 'package:blood_donation_app/secondpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
//Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('123');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Blood Donation App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => second(),
            ),
          );
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
      body:
      // StreamBuilder(stream: donor.snapshots(),
      // builder: (context, snapshot) {
      //   if(snapshot.hasData){
          
      //   }
      // },
      // )
       StreamBuilder(
        stream: donor.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          
          // if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot donorsnap = snapshot.data.docs[index];
                return Text(donorsnap['name']);
              },
            );
          //}
        
        },
      ),
    );
  }
}
