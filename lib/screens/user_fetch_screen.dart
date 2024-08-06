

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserFetchScreen extends StatelessWidget {
  const UserFetchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Users"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("clients").snapshots(),
        builder: ((context, snapshot) {
        if (snapshot.connectionState==ConnectionState.active){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index) => ListTile(
                title: Text(snapshot.data!.docs[index]["username"]),
                subtitle: Text(snapshot.data!.docs[index]["email"]),
              )));
          }
          else if(snapshot.hasError){
            return Text("Error");
          }
          else{
            return Text("No data");
          }
        }
        else if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        else{
          return Center(child: Text("Failed to load data"));
        }

      })),
    );
  }
}