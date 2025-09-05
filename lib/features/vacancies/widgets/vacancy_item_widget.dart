
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/auth/repository/local_repository.dart';
import 'package:jobboardapp/features/favourites/controller/favourite_controller.dart';
import 'package:jobboardapp/features/vacancies/model/vacancy_model.dart';
import 'package:jobboardapp/features/vacancies/widgets/company_profile_widget.dart';
import 'package:jobboardapp/features/vacancies/widgets/vacancy_tag_list_widget.dart';

class VacancyItemWidget extends ConsumerWidget {
  VacancyModel vacancyModel;
   VacancyItemWidget({super.key,required this.vacancyModel});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userId=ref.watch(localAuthRepositoryProvider).getUserId();

    return Card(
      elevation: 5,
      color: Colors.white,
      child:Stack(
        children: [
          Column(
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
             CompanyProfileWidget(vacancyModel: vacancyModel,)
              
              
            ],
          ),
          Positioned(top: 10,right: 10,child: GestureDetector(
            onTap: (){
              ref.read(favouriteControllerProvider.notifier)
              .addToFavourites(vacancyModel.vacancyId.toString(), userId.toString(), context);
            },
            child: Image.asset("assets/images/favourite.png",
            height: 20,width: 20,),
          ))
        ],
      ),
    );
  }
}