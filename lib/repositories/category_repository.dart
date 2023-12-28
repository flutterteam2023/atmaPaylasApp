// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/features/Category/models/main_category_model.dart';

class CategoryRepository extends ApiService {
  List<MainCategoryModel> maincategories = [];

  Future<ApiResponse<List<MainCategoryModel>>> getMainCategories() async {
    if (maincategories.isNotEmpty) {
      Log.info(
        'Categories already fetched length:${maincategories.length}',
        path: 'Category Repository getMainCategories',
      );
      return ApiResponse.right(maincategories);
    }
    return requestMethod<List<MainCategoryModel>>(
      path: '/categories/',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) =>
          (response.data as List<dynamic>).map((e) => MainCategoryModel.fromJson(e as Map<String, dynamic>)).toList(),
      headers: {'Accept': 'application/json'},
    ).then((value) {
      value.fold(
        (l) => null,
        (r) => {
          for (final element in r)
            if (!maincategories.contains(element)) maincategories.add(element),
        },
      );
      return value;
    });
  }
}
