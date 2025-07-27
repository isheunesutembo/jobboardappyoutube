


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showSnackBar (BuildContext context,String text){
  ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(SnackBar(backgroundColor: Colors.orange,content: Text(text)));
}