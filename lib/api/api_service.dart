// ignore_for_file: lines_longer_than_80_chars, avoid_dynamic_calls, non_constant_identifier_names

import 'dart:convert';

import 'package:atma_paylas_app/api/auth_interceptor.dart';
import 'package:atma_paylas_app/api/log.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum HttpMethod { get, post, delete, put }

String BASE_URL = 'https://atmapaylas.com.tr/api';
String IMAGE_BASE_URL = 'https://atmapaylas.com.tr';
typedef ApiResponse<T> = Either<String, T>;

class ApiService {
  // Normal constructor
  ApiService() : dio = Dio() {
    dio.options
      ..baseUrl = BASE_URL
      ..connectTimeout = const Duration(seconds: 14)
      ..receiveTimeout = const Duration(seconds: 14);
    dio.interceptors
      ..add(AuthInterceptor(dio))
      ..add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
  }
  late Dio dio;

  Future<Either<String, T>> requestMethod<T>({
    required String path,
    required Map<String, dynamic>? headers,
    required T Function(Response<dynamic>) responseConverter,
    required dynamic requestModel,
    required HttpMethod method,
  }) async {
    try {
      Response<dynamic> response;

      switch (method) {
        case HttpMethod.get:
          response = await dio.get(
            path,
            options: Options(method: 'GET', headers: headers),
          );
        case HttpMethod.put:
          final data = json.encode(requestModel);
          response = await dio.put(
            path,
            options: Options(method: 'PUT', headers: headers),
            data: requestModel == null ? null : data,
          );
        case HttpMethod.post:
          final data = json.encode(requestModel);
          response = await dio.post(
            path,
            options: Options(method: 'POST', headers: headers),
            data: requestModel == null ? null : data,
          );
        case HttpMethod.delete:
          final data = requestModel != null ? json.encode(requestModel) : null;
          response = await dio.delete(
            path,
            options: Options(method: 'DELETE', headers: headers),
            data: requestModel == null ? null : data,
          );
      }
      return Right(responseConverter(response));
    } on DioException catch (e) {
      Log.error(e);
      if (e.response?.data['error'] != null) {
        return Left(e.response?.data['error'] as String);
      }
      if (e.response?.statusCode == 504) {
        return const Left('Gateway error');
      }
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return const Left('Hata oluştu, Exception: connectionTimeout');
        case DioExceptionType.sendTimeout:
          return const Left('Hata oluştu, Exception: sendTimeout');
        case DioExceptionType.receiveTimeout:
          return const Left('Hata oluştu, Exception: receiveTimeout');
        case DioExceptionType.badCertificate:
          return const Left('Hata oluştu, Exception: badCertificate');
        case DioExceptionType.badResponse:
          return const Left('Hata oluştu, Exception: badResponse');
        case DioExceptionType.cancel:
          return const Left('Hata oluştu, Exception: cancel');
        case DioExceptionType.connectionError:
          return const Left('Hata oluştu, Exception: connectionError');
        case DioExceptionType.unknown:
          return const Left('Hata oluştu, Exception: unknown');
      }
    }
  }
}
