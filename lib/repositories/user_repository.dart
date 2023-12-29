// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/features/Authentication/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

///Repository usage example:
///GetIt.instance<UserRepository>().getMyUserProfile() is returned as Future<ApiResponse<UserModel>>
///GetIt.instance<UserRepository>().getOtherUserProfile(userId: 2) is returned as Future<ApiResponse<UserModel>>
class UserRepository extends ApiService {
  static UserModel? user;
  Future<ApiResponse<UserModel>> getMyUserProfile() async {
    return requestMethod<UserModel>(
      path: '/user_profile/',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => UserModel.fromJson(response.data as Map<String, dynamic>),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  Future<ApiResponse<UserModel>> getOtherUserProfile({required int userId}) async {
    return requestMethod<UserModel>(
      path: '/user_profile/$userId',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => UserModel.fromJson(response.data as Map<String, dynamic>),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  ///this method is used for edit my user profile photo
  ///if you want to edit your profile photo, you must send profilePhotoFile
  ///if you want image picker, you can use this code:
  /*  
      File? image;
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        image = File(pickedFile.path);
        await GetIt.instance<UserRepository>().editUserProfilePhoto(image);
      } 
  */
  Future<void> editUserProfilePhoto(
    File? profilePhotoFile,
  ) async {
    if (profilePhotoFile != null) {
      const storage = FlutterSecureStorage();
      final accessToken = await storage.read(key: 'access_token');
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      final request = http.MultipartRequest('PUT', Uri.parse('$BASE_URL/edit_user_profile/'));
      request.files.add(await http.MultipartFile.fromPath('image', profilePhotoFile.path));
      request.headers.addAll(headers);

      final response = await request.send();

      if (response.statusCode == 200) {
        Log.success(await response.stream.bytesToString());
      } else {
        Log.error(response.reasonPhrase);
      }
    }
  }

  ///this method is used for edit my user profile
  ///if you want to edit your username, you must send userName
  ///if you want to edit your name, you must send name
  ///if you want to edit your surname, you must send surname
  ///if you want to edit your user located city, you must send userLocatedCity
  ///if you want to edit your user located district, you must send userLocatedDistrict
  ///if you want to edit your user profile, you must send all of them
  ///if any of them is null, it will not be edited

  Future<Either<String, Map<String, dynamic>>> editUserProfile(
    String? userName,
    String? name,
    String? surname,
    String? userLocatedCity,
    String? userLocatedDistrict,
  ) async {
    final formData = FormData();

    if (userName != null) formData.fields.add(MapEntry('username', userName));
    if (name != null) formData.fields.add(MapEntry('name', name));
    if (surname != null) formData.fields.add(MapEntry('surname', surname));
    if (userLocatedCity != null) formData.fields.add(MapEntry('user_located_city', userLocatedCity));
    if (userLocatedDistrict != null) formData.fields.add(MapEntry('user_located_district', userLocatedDistrict));

    try {
      final response = await dio.put<Map<String, dynamic>>(
        '/edit_user_profile/',
        options: Options(
          method: 'PUT',
          headers: {
            'Content-Type': 'multipart/form-data',
            'Accept': 'application/json',
          },
        ),
        data: formData,
      );

      if (response.statusCode == 200) {
        Log.success(json.encode(response.data));
        return Right(response.data!);
      } else {
        Log.error(response.statusMessage);
        return Left(response.statusMessage ?? 'Error');
      }
    } catch (error) {
      Log.error('Error uploading image: $error');
      return Left('Error uploading image: $error');
    }
  }
}
