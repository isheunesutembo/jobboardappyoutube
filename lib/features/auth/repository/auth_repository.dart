import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobboardapp/config/config.dart';
import 'package:jobboardapp/features/auth/model/usermodel.dart';
import 'package:jobboardapp/features/auth/repository/local_repository.dart';
import 'package:http/http.dart' as http;
import 'package:jobboardapp/providers/providers.dart';
import 'package:jobboardapp/util/failure.dart';
final authRepositoryProvider=Provider((ref)=>AuthRepository(ref.watch(localAuthRepositoryProvider), ref.watch(httpProvider)));

class AuthRepository{
  final LocalAuthRepository _localAuthRepository;
  final http.Client _client;

  AuthRepository(this._localAuthRepository,this._client);

  Future<Either<AppFailure,UserModel>>logInWithEmailAndPassword(String email,String password)async{
   var requestHeaders=<String,String>{
    "Accept":"application/json",
    "Content-Type":"application/json"
   };

   var url =Uri.http(AppConfig.baseUrl,AppConfig.logInUrl);

   var response=await _client.post(
    url,headers: requestHeaders,
    body: jsonEncode({"email":email,"password":password})
   );
   var data=jsonDecode(response.body);

   try{
    if(response.statusCode==200||response.statusCode==201){
      _localAuthRepository.setUserId(data['_id'].toString());
      _localAuthRepository.setToken(data['userToken']);
      return Right(UserModel.fromJson(data));
    }else{
      return Left(AppFailure(message: data['message']));
    }
   }catch(error){
    return Left(AppFailure(message: error.toString()));
   }
  }

  Future<Either<AppFailure,UserModel>>signUpWithEmailAndPassword(String email,String username,String password)async{
   var requestHeaders=<String,String>{
    "Accept":"application/json",
    "Content-Type":"application/json"
   };

   var url =Uri.http(AppConfig.baseUrl,AppConfig.registerUrl);

   var response=await _client.post(
    url,headers: requestHeaders,
    body: jsonEncode({"email":email,"username":username,"password":password})
   );
   var data=jsonDecode(response.body);

   try{
    if(response.statusCode==200||response.statusCode==201){
     
      return Right(UserModel.fromJson(data));
    }else{
      return Left(AppFailure(message: data['message']));
    }
   }catch(error){
    return Left(AppFailure(message: error.toString()));
   }
  }
}