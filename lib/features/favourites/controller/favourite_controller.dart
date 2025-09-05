

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobboardapp/features/favourites/model/favourite_model.dart';
import 'package:jobboardapp/features/favourites/repository/favourite_repository.dart';
import 'package:jobboardapp/util/util.dart';
final favouriteControllerProvider=AsyncNotifierProvider<FavouriteController,AsyncValue<void>>(FavouriteController.new);
final getFavouritesProvider=FutureProvider.family((ref,String userId){
  final favourites=ref.watch(favouriteControllerProvider.notifier).getFavourites(userId);
  return favourites;
});

class FavouriteController extends AsyncNotifier<AsyncValue<void>>{
  late FavouriteRepository _favouriteRepository;


  @override
    AsyncValue<void>build(){

      _favouriteRepository=ref.watch(favouriteRepositoryProvider);

      return AsyncValue.data(null);
    }

    Future<void>addToFavourites(String vacancyId,String userId,BuildContext context)async{
      final res=await _favouriteRepository.addToFavourites(vacancyId, userId);
      final val =switch(res){
        Left(value:final l)=>showSnackBar(context, l.message),
         Right(value:final r)=>showSnackBar(context, r.toString())

      };
    }

      Future<List<FavouriteModel>>getFavourites(String userId)async{
      final res=await _favouriteRepository.getFavourites(userId);
       return switch(res){
        Left(value:final l)=>throw l,
        Right(value:final r)=>r
       };
    }

    Future<void>deleteFavourites(String favouriteId,BuildContext context)async{
      final res=await _favouriteRepository.deleteFavourites(favouriteId);
      final val =switch(res){
        Left(value:final l)=>showSnackBar(context, l.message),
         Right(value:final r)=>showSnackBar(context, r.toString())

      };
    }
}