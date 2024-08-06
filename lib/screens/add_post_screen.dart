import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_setup/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();

    void addPost() async {
      final FirebaseAuth _auth = await FirebaseAuth.instance;
      final FirebaseFirestore _fireStore = await FirebaseFirestore.instance;
      User? user = _auth.currentUser;
      _fireStore.collection("posts").add({
        "post": _textEditingController.text,
        "UserId": user!.uid,
      }).then((value) => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen())));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add post"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: "Enter your post"),
          ),
          ElevatedButton(
              onPressed: () {
                addPost();
              },
              child: Text("Add Post")),
        ],
      ),
    );
  }
}
