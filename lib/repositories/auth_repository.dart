// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/features/Authentication/models/access/access_model.dart';
import 'package:atma_paylas_app/features/Authentication/models/register_request/register_request_model.dart';
import 'package:atma_paylas_app/features/Authentication/models/register_response/register_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

///This repository is used for authentication
///Repository usage example:
///GetIt.instance<AuthRepository>().login('email', 'password') is returned as Future<ApiResponse<AccessModel>>
///GetIt.instance<AuthRepository>().register(RegisterRequestModel) is returned as Future<ApiResponse<RegisterResponseModel>>
///GetIt.instance<AuthRepository>().refresh() is returned as Future<ApiResponse<AccessModel>>
///GetIt.instance<AuthRepository>().logout() is returned as Future<ApiResponse<String>>
class AuthRepository extends ApiService {
  final storage = const FlutterSecureStorage();
  Future<ApiResponse<AccessModel>> login(String email, String password) async {
    final resp = await requestMethod<dynamic>(
      path: '/login/',
      method: HttpMethod.post,
      requestModel: {
        'email': email,
        'password': password,
      },
      responseConverter: (response) => response,
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    );
    return resp.fold(
      ApiResponse.left,
      (r) async {
        //access token

        await storage.write(key: 'access_token', value: (r as Response<Map<String, String>>).data?['access']);
        //refresh token
        final setCookieHeaders = r.headers['set-cookie'];
        final firstSetCookieHeader = setCookieHeaders![0];
        final cookieValue = firstSetCookieHeader.split(';').first;
        await storage.write(key: 'refresh_token', value: cookieValue);
        return ApiResponse.right(AccessModel.fromJson(r.data!));
      },
    );
  }

  Future<ApiResponse<RegisterResponseModel>> register(RegisterRequestModel request) async {
    return requestMethod<RegisterResponseModel>(
      path: '/register/',
      method: HttpMethod.post,
      requestModel: request.toJson(),
      responseConverter: (response) => RegisterResponseModel.fromJson(response as Map<String, dynamic>),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    );
  }

  Future<ApiResponse<AccessModel>> refresh() async {
    final refreshToken = await storage.read(key: 'refresh_token');
    return requestMethod<AccessModel>(
      path: '/token/refresh/',
      method: HttpMethod.post,
      requestModel: null,
      responseConverter: (response) => AccessModel.fromJson(response.data as Map<String, dynamic>),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Cookie': refreshToken,
      },
    ).then((value) {
      value.fold(
        (l) => null,
        (r) {
          storage.write(key: 'access_token', value: r.access);
        },
      );

      return value;
    });
  }

  Future<ApiResponse<String>> logout() async {
    final refreshToken = await storage.read(key: 'refresh_token');
    return requestMethod<String>(
      path: '/logout/',
      method: HttpMethod.post,
      requestModel: null,
      responseConverter: (response) => (response as Response<Map<String, dynamic>>).data?['success'] as String,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Cookie': refreshToken,
      },
    ).then((value) {
      value.fold(
        (l) => null,
        (r) {
          storage
            ..delete(key: 'access_token')
            ..delete(key: 'refresh_token');
        },
      );

      return value;
    });
  }
}
