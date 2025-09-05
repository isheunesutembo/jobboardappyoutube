import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/auth/repository/local_repository.dart';
import 'package:jobboardapp/features/favourites/controller/favourite_controller.dart';
import 'package:jobboardapp/features/vacancies/model/vacancy_model.dart';
import 'package:jobboardapp/features/vacancies/widgets/company_profile_widget.dart';
import 'package:jobboardapp/features/vacancies/widgets/vacancy_tag_list_widget.dart';
import 'package:jobboardapp/util/custom_circle_icon_widget.dart';

class VacancyDetailsScreen extends ConsumerWidget {
  const VacancyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final vacancy =ModalRoute.of(context)!.settings.arguments as VacancyModel;
    final userId=ref.watch(localAuthRepositoryProvider).getUserId();
    return  Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              GestureDetector(onTap: (){
                Navigator.pop(context);
              },child: CustomCircleIconWidget(icon: Image.asset("assets/images/backicon.png"),)),
              GestureDetector(onTap: (){
                   ref.read(favouriteControllerProvider.notifier)
              .addToFavourites(vacancy.vacancyId.toString(), userId.toString(), context);
              },child: CustomCircleIconWidget(icon: Image.asset("assets/images/favourite.png"),))
            ],),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(vacancy.title.toString(),
            style: TextStyle(color: Colors.black,
            fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          const SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Salary:",
            style: TextStyle(color: Colors.black,
            fontSize: 15,fontWeight: FontWeight.w800),),
          ),
          const SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(vacancy.salary.toString(),
            style: TextStyle(color: Colors.black,
            fontSize: 13,fontWeight: FontWeight.w300),),
          ),
            const SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Job Description:",
            style: TextStyle(color: Colors.black,
            fontSize: 15,fontWeight: FontWeight.w800),),
          ),
          const SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(vacancy.description.toString(),
            style: TextStyle(color: Colors.black,
            fontSize: 13,fontWeight: FontWeight.w300),),
          ),

            const SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Experience:",
            style: TextStyle(color: Colors.black,
            fontSize: 15,fontWeight: FontWeight.w800),),
          ),
          const SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(vacancy.experience.toString(),
            style: TextStyle(color: Colors.black,
            fontSize: 13,fontWeight: FontWeight.w300),),
          ),
          const SizedBox(height: 10,),
            const SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Job Requirements:",
            style: TextStyle(color: Colors.black,
            fontSize: 15,fontWeight: FontWeight.w800),),
          ),
          const SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(vacancy.requirements.toString(),
            style: TextStyle(color: Colors.black,
            fontSize: 13,fontWeight: FontWeight.w300),),
          ),
          const SizedBox(height: 10,),
          Center(
            child: SizedBox(
              width: 378,height: 75,
              child: ElevatedButton(onPressed: (){
              
              },style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ) ,child: Text("apply",
              style: TextStyle(
                color: Colors.white,fontSize: 18,
                fontWeight: FontWeight.bold
              ),)),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: VacancyTagListWidget(vacancyModel: vacancy),
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text("Vacancy Listed By",
                style: TextStyle(
                  color: Colors.black,fontSize: 15,
                  fontWeight: FontWeight.w800
                ),),
           ),
           CompanyProfileWidget(vacancyModel: vacancy)
        ],),
      )),
    );
  }
}