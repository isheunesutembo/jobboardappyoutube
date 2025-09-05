

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:jobboardapp/config/config.dart';
import 'package:jobboardapp/features/auth/repository/local_repository.dart';
import 'package:jobboardapp/features/favourites/model/favourite_model.dart';
import 'package:jobboardapp/providers/providers.dart';
import 'package:jobboardapp/util/failure.dart';
import 'package:jobboardapp/util/success_response.dart';
final favouriteRepositoryProvider=Provider((ref)=>FavouriteRepository(client: ref.watch(httpProvider), localAuthRepository: ref.watch(localAuthRepositoryProvider)));
class FavouriteRepository {
  final http.Client _client;
  final LocalAuthRepository _localAuthRepository;
  FavouriteRepository({required http.Client client,
  required LocalAuthRepository localAuthRepository}):_localAuthRepository=localAuthRepository,
  _client=client;

  //adding a vacancy to favaourites

  Future<Either<AppFailure,SuccessResponse>>addToFavourites(
    String vacancyId,String userId
  )async{
    Map<String,String>requestHeaders={
      'Content-Type':"application/json",
      "Authorization":"Bearer ${_localAuthRepository.getUserToken()}"

    };

    var url =Uri.http(AppConfig.baseUrl,AppConfig.favouriteUrl);

    var response =await _client.post(url,
    headers: requestHeaders,
    body:jsonEncode({
      "userId":userId,
      "vacancy":vacancyId
    }));

    var data=jsonDecode(response.body);

    try{
      if(response.statusCode==200||response.statusCode==201){
        return Right(SuccessResponse(message: data['message']));
      }else{
        return Left(AppFailure(message: data['message']));
      }
    }catch(e){
      return Left(AppFailure(message: data['message']));
    }
  }


  // gettting vacancies from favourites

  Future<Either<AppFailure,List<FavouriteModel>>>getFavourites(String userId)async{
    Map<String,String>requestHeaders={
      'Content-Type':"application/json",
      "Authorization":"Bearer ${_localAuthRepository.getUserToken()}"

    };

    var url=Uri.http(AppConfig.baseUrl,"${AppConfig.favouriteUrl}/$userId");

    var response =await _client.get(url,headers: requestHeaders);
    var data=jsonDecode(response.body);
    List<dynamic>vacancies=[];
    vacancies=jsonDecode(response.body);

    try{
   if(response.statusCode==200){
    return Right(favouritesFromJson(vacancies));
   }else{
    return Left(AppFailure(message: data['message']));
   }
    }catch(e){
    return Left(AppFailure(message: e.toString()));
    }
  }

  //deleting a vacancy from favourites

  Future<Either<AppFailure,SuccessResponse>>deleteFavourites(String userId)async{
    Map<String,String>requestHeaders={
      'Content-Type':"application/json",
      "Authorization":"Bearer ${_localAuthRepository.getUserToken()}"

    };

    var url=Uri.http(AppConfig.baseUrl,"${AppConfig.favouriteUrl}/$userId");

    var response =await _client.delete(url,headers: requestHeaders);
    var data=jsonDecode(response.body);
   

    try{
   if(response.statusCode==200){
    return Right(SuccessResponse(message: data['message']));
   }else{
    return Left(AppFailure(message: data['message']));
   }
    }catch(e){
    return Left(AppFailure(message: e.toString()));
    }
  }


}
