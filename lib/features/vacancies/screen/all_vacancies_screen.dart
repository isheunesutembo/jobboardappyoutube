import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/vacancies/controller/vacancy_controller.dart';
import 'package:jobboardapp/features/vacancies/widgets/vacancy_item_widget.dart';
import 'package:jobboardapp/util/errortext.dart';
import 'package:jobboardapp/util/loader.dart';

class AllVacanciesScreen extends ConsumerStatefulWidget {
  const AllVacanciesScreen({super.key});

  @override
  ConsumerState<AllVacanciesScreen> createState() => _AllVacanciesScreenState();
}

class _AllVacanciesScreenState extends ConsumerState<AllVacanciesScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(vacancyControllerProvider);
    final vacancy=ref.watch(vacancyControllerProvider.notifier);
    return state.when(
      data: (data) {

        return NotificationListener<ScrollNotification>(
          onNotification:(scrollInfo){
            if(scrollInfo.metrics.pixels==scrollInfo.metrics.maxScrollExtent){
               vacancy.loadMore();

            }
            return false;
          } ,
          child: RefreshIndicator(onRefresh: (){
            return vacancy.refresh();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text("All Vacancies",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
              
            ),
            body: Column(
              children: [
                Expanded(child: ListView.builder(physics: BouncingScrollPhysics(),itemCount: data.data.length,
                shrinkWrap: true,itemBuilder: (context,index){
                  return VacancyItemWidget(vacancyModel: data.data[index]);
                })),
                if(state.value!.hasNext!||(state.isLoading&&state.hasValue))...{
                  Padding(padding: EdgeInsets.all(16),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.orange,
                  ),)
                }
              ],
            ),
          ),),
        );
      },
      error: (error, stackTrace) => Errortext(error: error.toString()),
      loading: () => Loader(),
    );
  }
}
