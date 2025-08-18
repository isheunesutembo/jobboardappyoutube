import 'package:flutter/widgets.dart';
import 'package:jobboardapp/features/vacancies/model/vacancy_model.dart';
import 'package:jobboardapp/features/vacancies/widgets/vacancy_item_widget.dart';
import 'package:jobboardapp/features/vacancies/widgets/vacncy_tags_widget.dart';

class VacancyTagListWidget extends StatelessWidget {
  VacancyModel vacancyModel;
   VacancyTagListWidget({super.key,required this.vacancyModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(shrinkWrap: true,itemCount: vacancyModel.skillTags!.length,scrollDirection: Axis.horizontal,itemBuilder: (context,index){
      return VacancyTagsWidget(tag: vacancyModel.skillTags![index]);
      }),
    );
  }
}