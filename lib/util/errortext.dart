import 'package:flutter/material.dart';

class Errortext extends StatelessWidget {
  String error;
   Errortext({super.key,required this.error});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(error),
    );
  }
}