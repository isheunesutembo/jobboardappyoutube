


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobboardapp/features/auth/repository/auth_repository.dart';
import 'package:jobboardapp/util/util.dart';
final authControllerProvider=AsyncNotifierProvider<AuthController,AsyncValue<void>>(AuthController.new);
class AuthController extends AsyncNotifier<AsyncValue<void>>{
  late AuthRepository _authRepository;

  @override 
  AsyncValue<void>build(){
    _authRepository=ref.watch(authRepositoryProvider);

    return const AsyncValue.data(null);
  }
  Future<void>logInWithEmailAndPassword(
    String email,String password,BuildContext context
  )async{
    final user =await _authRepository.logInWithEmailAndPassword(email, password);

    final val=switch(user){
    Left(value:final l)=>showSnackBar(context,l.message),
    Right(value:final r)=>Navigator.pushNamed(context, "/mainscreen")

    };
  }

   Future<void>signUpWithEmailAndPassword(
    String email,String username,String password,BuildContext context
  )async{
    final user =await _authRepository.signUpWithEmailAndPassword(email,username, password);

    final val=switch(user){
    Left(value:final l)=>showSnackBar(context,l.message),
    Right(value:final r)=>Navigator.pushNamed(context, "/signinscreen")

    };
  }

}