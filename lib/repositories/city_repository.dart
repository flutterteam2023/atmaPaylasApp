// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/api/log.dart';

typedef CityName = String;
typedef DistrictNames = List<String>;

///Repository usage example:
///GetIt.instance<CityRepository>().getCities() is returned as Future<ApiResponse<List<String>>>
///GetIt.instance<CityRepository>().getDistricts('İstanbul') is returned as Future<ApiResponse<List<String>>>
class CityRepository extends ApiService {
  List<String> cities = [];

  Map<CityName, DistrictNames> districts = {};

  Future<ApiResponse<List<String>>> getCities() async {
    if (cities.isNotEmpty) {
      Log.info(
        'Cities already fetched length:${cities.length}',
        path: 'Cities Repository getCities',
      );
      return ApiResponse.right(cities);
    }
    return requestMethod<List<String>>(
      path: '/get_cities/',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => (response.data as List<dynamic>).map((e) => e.toString()).toList(),
      headers: {'Accept': 'application/json'},
    ).then((value) {
      value.fold(
        (l) => null,
        (r) => {
          for (final element in r)
            if (!cities.contains(element)) cities.add(element),
        },
      );
      return value;
    });
  }

  Future<ApiResponse<List<String>>> getDistricts(String cityName) async {
    if ((districts[cityName] ?? []).isNotEmpty) {
      Log.info(
        'District already fetched length:${districts[cityName]!.length}',
        path: 'Cities Repository getDistricts',
      );
      return ApiResponse.right(districts[cityName]!);
    }

    return requestMethod<List<String>>(
      path: '/get_districts/$cityName',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => (response.data as List<dynamic>).map((e) => e.toString()).toList(),
      headers: {'Accept': 'application/json'},
    ).then((value) {
      value.fold(
        (l) => null,
        (r) => {
          for (final element in r)
            {
              if (districts[cityName] == null) districts[cityName] = [],
              if (!(districts[cityName]?.contains(element) ?? true))
                {
                  Log.info('deneme1'),
                  districts[cityName]?.add(element),
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
