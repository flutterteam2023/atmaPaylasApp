import 'dart:convert';

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/features/Authentication/models/access/access_model.dart';
import 'package:atma_paylas_app/features/Authentication/models/register_request/register_request_model.dart';
import 'package:atma_paylas_app/features/Authentication/models/register_response/register_response_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository extends ApiService {
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
      (l) => ApiResponse.left("error"),
      (r) async {
        //access token
        const storage = FlutterSecureStorage();

        await storage.write(key: "access_token", value: r.data["access"]);
        //refresh token
        final setCookieHeaders = r.headers['set-cookie'];
        final firstSetCookieHeader = setCookieHeaders![0];
        final cookieValue = firstSetCookieHeader.split(';').first;
        await storage.write(key: "refresh_token", value: cookieValue);
        return ApiResponse.right(AccessModel.fromJson(r.data));
      },
    );
  }

  Future<ApiResponse<RegisterResponseModel>> register(RegisterRequestModel request) async {
    return await requestMethod<RegisterResponseModel>(
      path: '/register/',
      method: HttpMethod.post,
      requestModel: request.toJson(),
      responseConverter: (response) => RegisterResponseModel.fromJson(response),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    );
  }

  Future<ApiResponse<AccessModel>> refresh() async {
    const storage = FlutterSecureStorage();
    final refreshToken = await storage.read(key: "refresh_token");
    return await requestMethod<AccessModel>(
      path: '/token/refresh/',
      method: HttpMethod.post,
      requestModel: null,
      responseConverter: (response) => AccessModel.fromJson(response.data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Cookie': refreshToken,
      },
    ).then((value) {
      value.fold(
        (l) => null,
        (r) {
          const storage = FlutterSecureStorage();
          storage.write(key: "access_token", value: r.access);
        },
      );

      return value;
    });
  }
}
