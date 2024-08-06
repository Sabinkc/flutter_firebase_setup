import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_setup/screens/home_screen.dart';
import 'package:firebase_setup/screens/login_screen.dart';
import 'package:firebase_setup/screens/test_screen.dart';
import 'package:firebase_setup/screens/user_fetch_screen.dart';
import 'package:firebase_setup/screens/user_store_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    );
  }
}
