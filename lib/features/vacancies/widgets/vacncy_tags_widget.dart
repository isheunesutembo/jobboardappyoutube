import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VacancyTagsWidget extends StatelessWidget {
  String tag;
   VacancyTagsWidget({super.key,required this.tag});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.all(2),
    child: Chip(backgroundColor: Colors.white,label: Text(tag,
    style: TextStyle(color: Colors.black),)),);
  }
}