import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_setup/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserStoreScreen extends StatefulWidget {
  const UserStoreScreen({super.key});

  @override
  State<UserStoreScreen> createState() => _UserStoreScreenState();
}

class _UserStoreScreenState extends State<UserStoreScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();

  saveData() async {
    try {
      CollectionReference colRef =
           FirebaseFirestore.instance.collection("clients");
      colRef.doc(usernameController.text).set({
        "username": usernameController.text,
        "email": emailController.text,
        "phonenumber": phonenoController.text,
      }).then((value) => showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text("Successfully added data to firebase"),
              ))));
      usernameController.clear();
      emailController.clear();
      phonenoController.clear();
    } on FirebaseException catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store users"),
      ),
        body: Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
                controller: usernameController,
                hinttext: "Enter your username"),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
                controller: emailController, hinttext: "Enter your email"),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
                controller: phonenoController,
                hinttext: "Enter your phone number"),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  saveData();
                },
                child: Text("Save data")),
          ],
        ),
      ),
    ));
  }
}
