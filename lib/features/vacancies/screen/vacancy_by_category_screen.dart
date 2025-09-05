import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/categories/models/category_model.dart';
import 'package:jobboardapp/features/vacancies/controller/vacancy_controller.dart';
import 'package:jobboardapp/features/vacancies/widgets/vacancy_item_widget.dart';
import 'package:jobboardapp/util/errortext.dart';
import 'package:jobboardapp/util/loader.dart';

class VacancyByCategoryScreen extends ConsumerWidget {
  const VacancyByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;

    final vacancy = ref.watch(
      getVacanciesByCategoryProvider(category.categoryId.toString()),
    );
    return vacancy.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "All Vacancies",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          body: Column(
            children: [
              if (data.isEmpty) ...{
                Center(child: Text('No Vacancies In This Category')),
              } else ...{
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return VacancyItemWidget(vacancyModel: data[index]);
                    },
                  ),
                ),
              },
            ],
          ),
        );
      },
      error: (error, stackTrace) => Errortext(error: error.toString()),
      loading: () => Loader(),
    );
  }
}
