import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/auth/repository/local_repository.dart';
import 'package:jobboardapp/features/favourites/controller/favourite_controller.dart';
import 'package:jobboardapp/features/favourites/widgets/favourite_item_widget.dart';
import 'package:jobboardapp/util/errortext.dart';
import 'package:jobboardapp/util/loader.dart';
import 'package:jobboardapp/util/route.dart';

class FavouriteListWidget extends ConsumerWidget {
  const FavouriteListWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userId=ref.watch(localAuthRepositoryProvider).getUserId();

    final favourites=ref.watch(getFavouritesProvider(userId.toString()));
    return favourites.when(data: (data){
      if(data.isEmpty){
        return Center(child: Text("No Vacancies Added Here"),);
      }

      return ListView.builder(itemCount: data.length,
      physics:const NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (context,index){
        return GestureDetector(onTap: (){
          Navigator.pushNamed(context, Routes.vacancydetailscreen,
          arguments: data[index].vacancy);
          
        },child: FavouriteItemWidget(vacancyModel: data[index].vacancy!),);
      });

    }, error: (error,stackTrace)=>Errortext(error: error.toString()), loading: ()=>Loader());
  }
}