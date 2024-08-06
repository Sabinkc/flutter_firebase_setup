import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_setup/screens/add_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UserUId:${_auth.currentUser!.uid}"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          // as we added our currentuser unique uid as userId in each of our post, here we accessed only the post that matches the currentUserId with userId section of post
          stream: FirebaseFirestore.instance
              .collection("posts")
              .where("UserId", isEqualTo: _auth.currentUser!.uid)
              .snapshots(),
          builder: ((context, snapshot) {
            try {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: ((context, index) => ListTile(
                            title: Text(snapshot.data!.docs[index]["post"]),
                          )));
                } else {
                  return Text("no data found");
                }
              } else {
                return Text("Failed to load data");
              }
            } catch (e) {
              return Center(child: Text(e.toString()));
            }
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: ((context) => AddPostScreen())));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
