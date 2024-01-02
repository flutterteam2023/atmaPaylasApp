// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/features/Feed/models/archived_feed_model.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

class ArchivedRepository extends ApiService with ChangeNotifier {
  List<ArchiveFeedModel> _archivedList = [];
  List<ArchiveFeedModel> get archivedList {
    final list = <ArchiveFeedModel>[];
    for (final element in _archivedList) {
      list.add(element);
    }
    return list;
  }

  void addArchivedList(ArchiveFeedModel value) {
    _archivedList.add(value);
    notifyListeners();
  }

  void removeArchivedList(ArchiveFeedModel value) {
    _archivedList.remove(value);
    notifyListeners();
  }

  void clearArchivedList() {
    _archivedList.clear();
    notifyListeners();
  }

  set archivedList(List<ArchiveFeedModel> value) {
    _archivedList = value;
    notifyListeners();
  }

  Future<ApiResponse<List<ArchiveFeedModel>>> getArchivedFeeds() async {
    if (archivedList.isNotEmpty) return Right(archivedList);
    return requestMethod<List<ArchiveFeedModel>>(
      path: '/listings/archived/',
      method: HttpMethod.get,
      requestModel: null,
      headers: {'Accept': 'application/json'},
      responseConverter: (response) =>
          (response.data as List<dynamic>).map((e) => ArchiveFeedModel.fromJson(e as Map<String, dynamic>)).toList(),
    ).then((value) {
      value.fold(
        (l) => null,
        (r) => {
          for (final element in r)
            if (!archivedList.contains(element)) addArchivedList(element),
        },
      );
      return value;
    });
  }

  Future<ApiResponse<bool>> toggleArchiveStatus({required int feedId}) async {
    return requestMethod<bool>(
      path: '/listings/archive/$feedId/',
      method: HttpMethod.post,
      requestModel: null,
      headers: {'Accept': 'application/json'},
      responseConverter: (response) => (response.data as Map<String, dynamic>)['is_archived'] as bool,
    );
  }
}
