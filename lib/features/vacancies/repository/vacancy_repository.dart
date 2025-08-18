

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:jobboardapp/config/config.dart';
import 'package:jobboardapp/features/vacancies/model/vacancy_model.dart';
import 'package:jobboardapp/providers/providers.dart';
import 'package:jobboardapp/util/failure.dart';

final vacancyRepositoryProvider=Provider((ref)=>VacancyRepository(client: ref.watch(httpProvider)));
class VacancyRepository {
  final http.Client _client;
  VacancyRepository({required http.Client client}):_client=client;

  Future<Either<AppFailure,List<VacancyModel>>>getVacancies({required int page,required int limit})async{
    Map<String,String>requestHeaders={
      "Accept":"application/json",
      "Content-Type":"application/json"
    };

    var url=Uri.http(AppConfig.baseUrl,AppConfig.vacanciesUrl,{
    'page':page.toString(),
    'limit':limit.toString()
    });

    var response=await _client.get(url,headers:requestHeaders);

    var data=jsonDecode(response.body);
    try{

      if(response.statusCode==200){
        return Right(vacanciesFromJson(data['vacancies']));
      }else{
       return  Left(AppFailure(message: data["message"]));
      }
    }
    catch(e){
      return Left(AppFailure(message: e.toString()));
    }
  }
Future<Either<AppFailure,List<VacancyModel>>>getVacanciesByCategory({required String categoryId })async{
    Map<String,String>requestHeaders={
      "Accept":"application/json",
      "Content-Type":"application/json"
    };

    var url=Uri.http(AppConfig.baseUrl,"${AppConfig.vacanciesUrl}/vacancyByCategory/$categoryId");

    var response=await _client.get(url,headers:requestHeaders);

    var data=jsonDecode(response.body);
    try{

      if(response.statusCode==200){
        return Right(vacanciesFromJson(data['vacancies']));
      }else{
       return  Left(AppFailure(message: data["message"]));
      }
    }
    catch(e){
      return Left(AppFailure(message: e.toString()));
    }
  }


  Future<Either<AppFailure,List<VacancyModel>>>searchVacancies(String search)async{
    Map<String,String>requestHeaders={
      "Accept":"application/json",
      "Content-Type":"application/json"
    };

    var url=Uri.http(AppConfig.baseUrl,"${AppConfig.vacanciesUrl}/search?query=$search");

    var response=await _client.get(url,headers:requestHeaders);

    var data=jsonDecode(response.body);
    try{

      if(response.statusCode==200){
        return Right(vacanciesFromJson(data['vacancies']));
      }else{
       return  Left(AppFailure(message: data["message"]));
      }
    }
    catch(e){
      return Left(AppFailure(message: e.toString()));
    }
  }


   Future<Either<AppFailure,VacancyModel>>getVacancyById(String vacancyId)async{
    Map<String,String>requestHeaders={
      "Accept":"application/json",
      "Content-Type":"application/json"
    };

    var url=Uri.http(AppConfig.baseUrl,"${AppConfig.vacanciesUrl}/$vacancyId");

    var response=await _client.get(url,headers:requestHeaders);

    var data=jsonDecode(response.body);
    try{

      if(response.statusCode==200){
        return Right(VacancyModel.fromJson(data));
      }else{
       return  Left(AppFailure(message: data["message"]));
      }
    }
    catch(e){
      return Left(AppFailure(message: e.toString()));
    }
  }

}