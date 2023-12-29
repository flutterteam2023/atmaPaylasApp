// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/features/Feed/models/feed_detail_model.dart';
import 'package:atma_paylas_app/features/Feed/models/my_feed_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

enum ListingTypes { free, tradable }

///Repository usage example:
///GetIt.instance<FeedRepository>().addFeed()
class FeedRepository extends ApiService {
  ///this method is used for add feed
  ///if you want to add feed, you must send image1, image2, image3, listingType, categoryId, title, description
  Future<Either<String, String>> addFeed(
    File? image1,
    File? image2,
    File? image3,
    ListingTypes listingType,
    int categoryId,
    String title,
    String description,
  ) async {
    const storage = FlutterSecureStorage();
    final accessToken = await storage.read(key: 'access_token');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    final request = http.MultipartRequest('POST', Uri.parse('$BASE_URL/create_listing/'));
    request.fields.addAll({
      'category': '$categoryId',
      'listing_type': listingType.name,
      'title': title,
      'description': description,
    });

    if (image1 != null) request.files.add(await http.MultipartFile.fromPath('image1', image1.path));
    if (image2 != null) request.files.add(await http.MultipartFile.fromPath('image2', image2.path));
    if (image3 != null) request.files.add(await http.MultipartFile.fromPath('image3', image3.path));

    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200) {
      Log.success(await response.stream.bytesToString());
      //yeni feed eklendiğinde myFeeds listesinin güncellenmesi için myFeeds listesini temizliyoruz
      _myFeeds.clear();
      return Right((jsonDecode(await response.stream.bytesToString()) as Map<String, dynamic>)['success'] as String);
    } else {
      Log.error(response.reasonPhrase);
      return Left(response.reasonPhrase ?? 'Error');
    }
  }

  ///this method is used for get feed details
  ///if you want to get feed details, you must send feedId
  Future<ApiResponse<FeedDetailModel>> getFeedDetails(String feedId) async {
    return requestMethod<FeedDetailModel>(
      path: '/get_listing_details/$feedId',
      method: HttpMethod.get,
      requestModel: null,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      responseConverter: (response) => FeedDetailModel.fromJson(response.data as Map<String, dynamic>),
    );
  }

  ///this method is used for edit feed
  Future<ApiResponse<String>> deleteFeed(String feedId) async {
    return requestMethod<String>(
      path: '/delete_listing/$feedId/',
      method: HttpMethod.delete,
      requestModel: null,
      headers: {'Accept': 'application/json'},
      responseConverter: (response) => (response.data as Map<String, dynamic>)['success'] as String,
    );
  }

  ///this method is used for current user all feeds
  ///in user interface not use this method please use getMyFeeds method
  ///is a private value
  final List<MyFeedModel> _myFeeds = [];
  //this method is used for current user free feeds active and inactive both
  FutureOr<List<MyFeedModel>> get myActiveAndInactiveFreeFeeds async {
    if (_myFeeds.isEmpty) await getMyFeeds();
    return _myFeeds.where((element) => element.listingType == ListingTypes.free.name).toList();
  }

  //this method is used for current user free feeds. just active
  FutureOr<List<MyFeedModel>> get myActiveFreeFeeds async {
    if (_myFeeds.isEmpty) await getMyFeeds();
    return _myFeeds
        .where((element) => element.listingType == ListingTypes.free.name && element.isActive == true)
        .toList();
  }

  //this method is used for current user free feeds. just inactive
  FutureOr<List<MyFeedModel>> get myInactiveFreeFeeds async {
    if (_myFeeds.isEmpty) await getMyFeeds();
    return _myFeeds
        .where((element) => element.listingType == ListingTypes.free.name && element.isActive == false)
        .toList();
  }

  //this method is used for current user tradable feeds active and inactive both
  FutureOr<List<MyFeedModel>> get myActiveAndInactiveTradableFeeds async {
    if (_myFeeds.isEmpty) await getMyFeeds();
    return _myFeeds.where((element) => element.listingType == ListingTypes.tradable.name).toList();
  }

  //this method is used for current user tradable feeds. just active
  FutureOr<List<MyFeedModel>> get myActiveTradableFeeds async {
    if (_myFeeds.isEmpty) await getMyFeeds();
    return _myFeeds
        .where((element) => element.listingType == ListingTypes.tradable.name && element.isActive == true)
        .toList();
  }

  //this method is used for current user tradable feeds. just inactive
  FutureOr<List<MyFeedModel>> get myInactiveTradableFeeds async {
    if (_myFeeds.isEmpty) await getMyFeeds();
    return _myFeeds
        .where((element) => element.listingType == ListingTypes.tradable.name && element.isActive == false)
        .toList();
  }

  ///this method is used for current user all feeds
  ///if my feeds is not empty return my feeds
  ///if my feeds is empty, fetch my feeds and return my feeds
  FutureOr<ApiResponse<List<MyFeedModel>>> getMyFeeds() async {
    if (_myFeeds.isNotEmpty) {
      Log.info(
        'MyFeeds already fetched length:${_myFeeds.length}',
        path: 'Feed Repository getMyFeeds',
      );
      return ApiResponse.right(_myFeeds);
    }
    return requestMethod<List<MyFeedModel>>(
      path: '/active_user_listing_previews/',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) =>
          (response.data as List<dynamic>).map((e) => MyFeedModel.fromJson(e as Map<String, dynamic>)).toList(),
      headers: {'Accept': 'application/json'},
    ).then((value) {
      value.fold(
        (l) => null,
        (r) => {
          for (final element in r)
            if (!_myFeeds.contains(element)) _myFeeds.add(element),
        },
      );
      return value;
    });
  }
}
