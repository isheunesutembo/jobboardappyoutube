import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/categories/widgets/category_widget.dart';
import 'package:jobboardapp/features/vacancies/controller/vacancy_controller.dart';
import 'package:jobboardapp/features/vacancies/widgets/vacancy_list_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                )
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,children: [
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Find Your Dream Job",
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),),
                ),
                SizedBox(height: 70,
                width: double.infinity
                ,child: Card(color: Colors.white,elevation: 5,child: TextField(
                  onChanged:(value){
                    ref.read(searchQueryProvider.notifier).state=value;
                  } ,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 40),
                    prefixIcon: Icon(Icons.search,size: 30,color: Colors.black,
                    ),
                    hintText: "Search by job title,skills",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                    ),
                  ),
                  
                )))
              ],),
            ),
            CategoryWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text("Vacancies",
                style: TextStyle(color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600),),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "/allvacanciesscreen");
                  },
                  child: Text("See All",
                  style: TextStyle(color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),),
                )
              ],),
            ),
            VacancyListWidget()
            
          ],
        ),
      ),
    );
  }
}