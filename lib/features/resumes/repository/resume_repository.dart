import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:jobboardapp/config/config.dart';
import 'package:jobboardapp/features/auth/repository/local_repository.dart';
import 'package:jobboardapp/features/resumes/model/resume_model.dart';
import 'package:jobboardapp/providers/providers.dart';
import 'package:jobboardapp/util/failure.dart';
import 'package:jobboardapp/util/success_response.dart';

final resumeRepositoryProvider = Provider(
  (ref) => ResumeRepository(
    client: ref.watch(httpProvider),
    localAuthRepository: ref.watch(localAuthRepositoryProvider),
  ),
);

class ResumeRepository {
  final http.Client _client;
  final LocalAuthRepository _localAuthRepository;
  ResumeRepository({
    required http.Client client,
    required LocalAuthRepository localAuthRepository,
  }) : _client = client,
       _localAuthRepository = localAuthRepository;

  //method for uploading our resume
  Future<Either<AppFailure, ResumeModel>> uploadResume(
    File resume,
    String title,
    String userId,
  ) async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Authorization": "Bearer ${_localAuthRepository.getUserToken()}",
    };

    var url = Uri.http(AppConfig.baseUrl, AppConfig.resumeUrl);
    var request = http.MultipartRequest('POST', Uri.parse(url.toString()));

    request.files.add(await http.MultipartFile.fromPath("resume", resume.path));
    request.headers.addAll(requestHeaders);
    request.fields["userId"] = userId;
    request.fields["title"] = title;

    try {
      var streamResponse = await request.send();
      var response = await http.Response.fromStream(streamResponse);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return Right(ResumeModel.fromJson(data));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (error) {
      return Left(AppFailure(message: error.toString()));
    }
  }

  //getting resumes
  Future<Either<AppFailure, List<ResumeModel>>> getUserResumes(
    String userId,
  ) async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Authorization": "Bearer ${_localAuthRepository.getUserToken()}",
    };

    var url = Uri.http(AppConfig.baseUrl, "${AppConfig.resumeUrl}/$userId");
    var response = await _client.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        return Right(resumesFromJson(data));
      } else {
        return Left(AppFailure(message: data["message"]));
      }
    } catch (error) {
      return Left(AppFailure(message: data['message']));
    }
  }

  //deleting resume
  Future<Either<AppFailure, SuccessResponse>> deleteUserResume(
    String resumeId,
  ) async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Authorization": "Bearer ${_localAuthRepository.getUserToken()}",
    };

    var url = Uri.http(AppConfig.baseUrl, "${AppConfig.resumeUrl}/$resumeId");
    var response = await _client.delete(url, headers: requestHeaders);
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        return Right(SuccessResponse(message: data["message"]));
      } else {
        return Left(AppFailure(message: data["message"]));
      }
    } catch (error) {
      return Left(AppFailure(message: data['message']));
    }
  }
}
