import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/auth/repository/local_repository.dart';
import 'package:jobboardapp/features/favourites/controller/favourite_controller.dart';
import 'package:jobboardapp/features/favourites/widgets/favourite_item_widget.dart';
import 'package:jobboardapp/features/favourites/widgets/favourite_list_widget.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userid=ref.watch(localAuthRepositoryProvider).getUserId();
    final favourites=ref.watch(getFavouritesProvider(userid.toString()));
    return Scaffold(
     body: SafeArea(child: RefreshIndicator(
      backgroundColor: Colors.black,
      onRefresh: ()=>ref.refresh(getFavouritesProvider(userid.toString()).future),
       child: SingleChildScrollView(
        child:Column(children: [
          Center(child: Text("Favourites",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
          FavouriteListWidget()
        ],) ,
       ),
     )),
    );
  }
}