import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/favourites/controller/favourite_controller.dart';
import 'package:jobboardapp/features/vacancies/model/vacancy_model.dart';
import 'package:jobboardapp/features/vacancies/widgets/vacancy_tag_list_widget.dart';

class FavouriteItemWidget extends ConsumerWidget {
  VacancyModel vacancyModel;
  FavouriteItemWidget({super.key, required this.vacancyModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: SizedBox(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    vacancyModel.title.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    vacancyModel.title.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VacancyTagListWidget(vacancyModel: vacancyModel),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  ref
                      .read(favouriteControllerProvider.notifier)
                      .deleteFavourites(
                        vacancyModel.vacancyId.toString(),
                        context,
                      );
                },
                child: Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
