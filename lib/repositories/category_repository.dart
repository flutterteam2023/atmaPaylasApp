// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/features/Category/models/main_category_model.dart';

typedef MainCategoryId = String;
typedef SubCategories = List<MainCategoryModel>;

///Repository usage example:
///GetIt.instance<CategoryRepository>().getSubcategory('3') is returned as Future<ApiResponse<List<MainCategoryModel>>>
///GetIt.instance<CategoryRepository>().getMainCategories() is returned as Future<ApiResponse<List<MainCategoryModel>>>
class CategoryRepository extends ApiService {
  List<MainCategoryModel> maincategories = [];
  Map<MainCategoryId, SubCategories> subCategories = {};

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

  Future<ApiResponse<List<MainCategoryModel>>> getSubcategory(String mainCategoryId) async {
    if ((subCategories[mainCategoryId] ?? []).isNotEmpty) {
      Log.info(
        'Subcategories already fetched length:${subCategories[mainCategoryId]!.length}',
        path: 'Category Repository getSubcategory',
      );
      return ApiResponse.right(subCategories[mainCategoryId]!);
    }

    return requestMethod<List<MainCategoryModel>>(
      path: '/categories/$mainCategoryId',
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
            {
              if (subCategories[mainCategoryId] == null) subCategories[mainCategoryId] = [],
              if (!(subCategories[mainCategoryId]?.contains(element) ?? true))
                {
                  Log.info('deneme1'),
                  subCategories[mainCategoryId]?.add(element),
                }
              else
                Log.info('deneme'),
            },
        },
      );
      return value;
    });
  }
}
