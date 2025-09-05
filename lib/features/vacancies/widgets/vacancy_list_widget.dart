import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/vacancies/controller/vacancy_controller.dart';
import 'package:jobboardapp/features/vacancies/widgets/vacancy_item_widget.dart';
import 'package:jobboardapp/util/errortext.dart';
import 'package:jobboardapp/util/loader.dart';
import 'package:jobboardapp/util/route.dart';

class VacancyListWidget extends ConsumerWidget {
  const VacancyListWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final vacancies=ref.watch(searchVacanciesProvider);
    return vacancies.when(data: (vacancies){
      if(vacancies.isEmpty){
        return Center(child: Text("No Vacancies Found",
        style: TextStyle(
          fontSize: 15,color: Colors.black,
          fontWeight: FontWeight.bold
        ),));
      }
      return ListView.builder(shrinkWrap: true,itemCount: vacancies.length,physics: const NeverScrollableScrollPhysics(),itemBuilder: (context,index){
        return GestureDetector(onTap: (){
          Navigator.pushNamed(context,Routes.vacancydetailscreen,
          arguments:vacancies[index] );
        },child: VacancyItemWidget(vacancyModel: vacancies[index]));
      });
    }, error: (error,stackTrace)=>Errortext(error: error.toString()), loading: ()=>Loader());
  }
}