// ignore_for_file: inference_failure_on_function_invocation, lines_longer_than_80_chars, avoid_dynamic_calls

import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._dio);
  final Dio _dio;

  bool isDebugMode = false;
  final storage = const FlutterSecureStorage();
  @override
  Future<dynamic> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await storage.read(key: 'access_token');
    GetIt.instance<AuthRepository>().lastAccessToken = accessToken;
    if (isDebugMode) Log.success('onrequestAlanında $accessToken');
    if (!options.path.contains('login') &&
        !options.path.contains('register') &&
        !options.path.contains('get_cities') &&
        !options.path.contains('refresh') &&
        !options.path.contains('categories') &&
        !options.path.contains('get_districts')) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (isDebugMode) {
      Log.error(err.response?.statusCode, path: 'auth interceptor on error');
      Log.info('${await storage.read(key: "refresh_token")}', path: 'auth interceptor on error');
    }
    await storage.read(key: 'access_token').then((value) => Log.info(value, path: 'mian'));
    await storage.read(key: 'refresh_token').then((value) => Log.info(value, path: 'mian'));
    if (err.response?.statusCode == 401) {
      if (await storage.read(key: 'refresh_token') != null) {
        final val = await GetIt.instance<AuthRepository>().refresh();
        return val.fold(
          (l) async {
            await storage.deleteAll().then((value) => handler.next(err));
          },
          (r) async => handler.resolve(await retry(err.requestOptions)),
        );
      }
    }
    return handler.next(err);
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    if (isDebugMode) {
      Log.success('tekrar deneniyor $requestOptions');
      Log.info('${requestOptions.method}, ${requestOptions.headers}');
      Log.info('${requestOptions.path} ${requestOptions.data} ${requestOptions.queryParameters}');
    }

    final options = Options(method: requestOptions.method, headers: requestOptions.headers);

    return _dio.request<dynamic>(
      //      '$BASE_URL${requestOptions.path}',

      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
