
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_setup/common/custom_textfield.dart';
import 'package:firebase_setup/screens/home_screen.dart';
import 'package:firebase_setup/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LogInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  signIn(String email, String password) async {
    try {
      if (email == "" || password == "") {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Enter required fields"),
              );
            });
      } else {
        UserCredential? userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      }
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
      backgroundColor: Color.fromARGB(248, 250, 249, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                  controller: _emailController, hinttext: "Enter your email"),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                  controller: _passwordController, hinttext: "Enter password"),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  signIn(_emailController.text, _passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[200]),
                child: Text("LogIn")),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text("SignUp"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
