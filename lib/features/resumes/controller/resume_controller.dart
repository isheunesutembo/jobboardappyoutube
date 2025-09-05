


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobboardapp/features/auth/repository/local_repository.dart';
import 'package:jobboardapp/features/resumes/model/resume_model.dart';
import 'package:jobboardapp/features/resumes/repository/resume_repository.dart';
import 'package:jobboardapp/util/util.dart';
final resumeControllerProvider=AsyncNotifierProvider<ResumeController,List<ResumeModel>>(ResumeController.new);

final gettingResumesProvider=FutureProvider.family<List<ResumeModel>,String>((ref,userId){
  final resume=ref.watch(resumeControllerProvider.notifier).getResumes(userId);
  return resume;
});
class ResumeController extends AsyncNotifier<List<ResumeModel>>{
  late ResumeRepository _resumeRepository;
  late LocalAuthRepository _localAuthRepository;
  
  @override   
  Future<List<ResumeModel>>build()async{
    _localAuthRepository=ref.watch(localAuthRepositoryProvider);
    _resumeRepository=ref.watch(resumeRepositoryProvider);
   return getResumes(_localAuthRepository.getUserId().toString());

  }

  Future<void>uploadResume(File resume,String title,String userId,BuildContext context)async{
    final res=await _resumeRepository.uploadResume(resume, title, userId);
    final val =switch(res){
      Right(value:final r)=>showSnackBar(context, r.toString()),
        Left(value:final l)=>showSnackBar(context, l.toString()),

    };
  }

  Future<List<ResumeModel>>getResumes(String userId)async{
    final res=await _resumeRepository.getUserResumes(userId);
    return switch(res){
      Left(value:final l)=>throw l.message,
      Right(value:final r)=>r
    };
  }

  Future<void>deleteResume(BuildContext context,String resumeId)async{
    final res=await _resumeRepository.deleteUserResume(resumeId);
    return switch(res){
      Left(value:final l)=>throw l.message,
      Right(value:final r)=>showSnackBar(context, r.toString())

    };
  }
}