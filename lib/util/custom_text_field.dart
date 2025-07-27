import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hinttext;
  final Widget? label;
  TextEditingController controller;
   CustomTextField({super.key, this.hinttext,
  this.label,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
     controller: controller,
     decoration: InputDecoration(
      fillColor: Colors.white,
      hoverColor: Colors.black,
      filled: true,
      hintText: hinttext,
      contentPadding:  const EdgeInsets.symmetric(vertical: 25,horizontal: 8),
      hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
      fontSize: 20),
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black,width: 3),
        borderRadius: BorderRadius.circular(10)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black,width: 3),
        borderRadius: BorderRadius.circular(10)
      )
     ),
    );
  }
}