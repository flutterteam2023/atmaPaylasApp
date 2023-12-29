import 'dart:convert';

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/api/log.dart';
import 'package:dio/dio.dart';

///yapılıyor....
class ImageEndpoints extends ApiService {
  Future<void> uploadImage(String path) async {
    var data = FormData.fromMap({
      'files': "",
      'username': '<username>',
      'name': 'testing',
      'surname': '<surname>',
      'user_located_city': '<City>',
      'user_located_district': '<district>'
    });
    Log.error(json.encode(data));
  }
}
