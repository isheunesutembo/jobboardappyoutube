import 'package:flutter/material.dart';
import 'package:jobboardapp/features/vacancies/model/vacancy_model.dart';

class CompanyProfileWidget extends StatelessWidget {
  VacancyModel vacancyModel;
CompanyProfileWidget({super.key,  required this.vacancyModel});

  @override
  Widget build(BuildContext context) {
    return   Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              vacancyModel.company!.logo!=null?
              CircleAvatar(backgroundColor: Colors.white,radius: 30,
              backgroundImage: NetworkImage(vacancyModel.company!.logo.toString()),):
              CircleAvatar(backgroundColor: Colors.white,radius: 30,
              backgroundImage: AssetImage("assets/images/person.png"),),
              Text(vacancyModel.company!.name.toString(),
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,
              color: Colors.black),)]));
  }
}