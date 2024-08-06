import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hinttext;
  CustomTextField({super.key,required this.controller,required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
                controller: controller,
                cursorHeight: 15,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: hinttext,
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color.fromARGB(229, 232, 232, 255),
                        width: 2,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color.fromARGB(229, 232, 232, 255),
                        width: 2,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color.fromARGB(229, 232, 232, 255),
                        width: 2,
                      )),
                ),
              ),
    );
  }
}