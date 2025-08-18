
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/vacancies/model/vacancy_model.dart';
import 'package:jobboardapp/features/vacancies/widgets/vacancy_tag_list_widget.dart';

class VacancyItemWidget extends ConsumerWidget {
  VacancyModel vacancyModel;
   VacancyItemWidget({super.key,required this.vacancyModel});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Card(
      elevation: 5,
      color: Colors.white,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(vacancyModel.title.toString(),
            style: TextStyle(fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w700),),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(vacancyModel.salary.toString(),
            style: TextStyle(fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w300),),
          ),
          const SizedBox(height: 10,),
          VacancyTagListWidget(vacancyModel: vacancyModel),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              vacancyModel.company!.logo!=null?
              CircleAvatar(backgroundColor: Colors.white,radius: 30,
              backgroundImage: NetworkImage(vacancyModel.company!.logo.toString()),):
              CircleAvatar(backgroundColor: Colors.white,radius: 30,
              backgroundImage: AssetImage("assets/images/person.png"),),
              Text(vacancyModel.company!.name.toString(),
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,
              color: Colors.black),)
            ],),
          )
          
        ],
      ),
    );
  }
}