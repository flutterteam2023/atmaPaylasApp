// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/active_requests.dart';
import 'package:dio/dio.dart';

class ActiveRequestInterceptor extends Interceptor {
  ActiveRequestInterceptor(this.activeRequests);
  final ActiveRequests activeRequests;
  @override
  Future<dynamic> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (activeRequests.hasActiveRequest(options.path)) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: 'Bu endpoint üzerinde zaten bir istek var.',
        ),
      );
      return;
    }

    activeRequests.addActiveRequest(options.path);
    handler.next(options);
  }

  @override
  Future<dynamic> onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) async {
    activeRequests.removeActiveRequest(response.requestOptions.path);
    handler.next(response);
  }

  @override
  Future<dynamic> onError(DioException err, ErrorInterceptorHandler handler) async {
    activeRequests.removeActiveRequest(err.requestOptions.path);
    handler.next(err);
  }
}
