// ignore_for_file: avoid_dynamic_calls

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/features/ReportAndBlock/models/report_block_user_model.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';

class BlockRepository extends ApiService with ChangeNotifier {
  final List<ReportBlockUserModel> _blockedUsers = [];

  ///Public method
  Future<List<ReportBlockUserModel>> blockedUsers() async {
    if (_blockedUsers.isEmpty) await _getBlockedUsers();
    final list = <ReportBlockUserModel>[];
    for (final element in _blockedUsers) {
      list.add(element);
    }
    return list;
  }

  ///Public method
  Future<Either<String, String>> addBlockUser(int userid) async {
    return _blockUser(userId: userid).then((value) {
      return value.fold(
        Left.new,
        (r) async {
          _blockedUsers.clear();
          notifyListeners();
          await GetIt.instance<FeedRepository>().clearFreeListingFeeds();
          await GetIt.instance<FeedRepository>().clearMostViewedFeeds();
          await GetIt.instance<FeedRepository>().clearTradableListingFeeds();

          return _getBlockedUsers().then((value) {
            return value.fold(
              Left.new,
              (r) => const Right('Kullanıcı Engellendi'),
            );
          });
        },
      );
    });
  }

  ///Public method
  Future<Either<String, String>> removeBlockUser(int userid) async {
    return _unblockUser(userId: userid).then((value) {
      return value.fold(
        Left.new,
        (r) async {
          _blockedUsers.clear();
          notifyListeners();
          await GetIt.instance<FeedRepository>().clearFreeListingFeeds();
          await GetIt.instance<FeedRepository>().clearMostViewedFeeds();
          await GetIt.instance<FeedRepository>().clearTradableListingFeeds();
          return _getBlockedUsers().then((value) {
            return value.fold(
              Left.new,
              (r) => const Right('Successfully'),
            );
          });
        },
      );
    });
  }

  ///private method
  Future<ApiResponse<List<ReportBlockUserModel>>> _getBlockedUsers() async {
    return requestMethod<List<ReportBlockUserModel>>(
      path: '/blocked_users/',
      method: HttpMethod.get,
      requestModel: null,
      headers: {'Accept': 'application/json'},
      responseConverter: (response) => (response.data as List<dynamic>)
          .map((e) => ReportBlockUserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    ).then((value) {
      value.fold(
        (l) => null,
        (r) => {
          for (final element in r)
            if (!_blockedUsers.contains(element)) _blockedUsers.add(element),
          notifyListeners(),
        },
      );
      return value;
    });
  }

  ///private method
  Future<ApiResponse<String>> _blockUser({required int userId}) async {
    return requestMethod<String>(
      path: '/block_user/$userId/',
      method: HttpMethod.post,
      requestModel: null,
      headers: {'Accept': 'application/json'},
      responseConverter: (response) {
        return response.data['success'] as String;
      },
    );
  }

  ///private method
  Future<ApiResponse<String>> _unblockUser({required int userId}) async {
    return requestMethod<String>(
      path: '/unblock_user/$userId/',
      method: HttpMethod.post,
      requestModel: null,
      headers: {'Accept': 'application/json'},
      responseConverter: (response) {
        return response.data['success'] as String;
      },
    );
  }
}
