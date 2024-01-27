import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/features/Category/models/main_category_model.dart';
import 'package:atma_paylas_app/features/Feed/models/feed_detail_model.dart';
import 'package:atma_paylas_app/features/Feed/models/feed_model.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:tuple/tuple.dart';

enum ListingTypes { free, tradable }

///Repository usage example:
///GetIt.instance<FeedRepository>().addFeed()
class FeedRepository extends ApiService with ChangeNotifier {
  ///this method is used for add feed
  ///if you want to add feed, you must send
  ///image1, image2, image3, listingType, categoryId, title, description
  Future<Either<String, String>> addFeed(
    List<File?> images,
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

    // if (image1 != null) {
    //   request.files.add(
    //     await http.MultipartFile.fromPath(
    //       'image1',
    //       image1.path,
    //     ),
    //   );
    // }
    // if (image2 != null) {
    //   request.files.add(
    //     await http.MultipartFile.fromPath(
    //       'image2',
    //       image2.path,
    //     ),
    //   );
    // }
    // if (image3 != null) {
    //   request.files.add(
    //     await http.MultipartFile.fromPath(
    //       'image3',
    //       image3.path,
    //     ),
    //   );
    // }

    for (final image in images) {
      if (image != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'images',
            image.path,
          ),
        );
      }
    }

    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 201) {
      Log.success(await response.stream.bytesToString());
      //yeni feed eklendiğinde myFeeds listesinin güncellenmesi için
      //myFeeds listesini temizliyoruz
      _myFeeds.clear();
      return Right(
        (jsonDecode(
          await response.stream.bytesToString(),
        ) as Map<String, dynamic>)['success'] as String,
      );
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
    ).then((value) {
      notifyListeners();
      clearFreeListingFeeds();
      clearMostViewedFeeds();
      clearTradableListingFeeds();
      clearMyFeeds();

      return value;
    });
  }

  List<FeedModel> _mostViewedFeeds = [];
  List<FeedModel> _freeListingFeeds = [];
  List<FeedModel> _tradableListingFeeds = [];
  Future<ApiResponse<void>> getHomePageFeeds() async {
    return requestMethod<void>(
      path: '/homepage_listings//',
      method: HttpMethod.get,
      requestModel: null,
      headers: {'Accept': 'application/json'},
      responseConverter: (response) {
        _mostViewedFeeds = (response.data['most_viewed'] as List<dynamic>)
            .map((e) => FeedModel.fromJson(e as Map<String, dynamic>))
            .toList();
        _freeListingFeeds = (response.data['free_listings'] as List<dynamic>)
            .map((e) => FeedModel.fromJson(e as Map<String, dynamic>))
            .toList();
        _tradableListingFeeds = (response.data['tradable_listings'] as List<dynamic>)
            .map((e) => FeedModel.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<List<FeedModel>> get mostViewedFeeds async {
    if (_mostViewedFeeds.isEmpty) await getHomePageFeeds();
    return _mostViewedFeeds;
  }

  Future<void> clearMostViewedFeeds() async {
    _mostViewedFeeds.clear();
    notifyListeners();
  }

  Future<List<FeedModel>> get freeListingFeeds async {
    if (_freeListingFeeds.isEmpty) await getHomePageFeeds();
    return _freeListingFeeds;
  }

  Future<void> clearFreeListingFeeds() async {
    _freeListingFeeds.clear();
    notifyListeners();
  }

  Future<List<FeedModel>> get tradableListingFeeds async {
    if (_tradableListingFeeds.isEmpty) await getHomePageFeeds();
    return _tradableListingFeeds.toList();
  }

  Future<void> clearTradableListingFeeds() async {
    _tradableListingFeeds.clear();
    notifyListeners();
  }

  ///this method is used for current user all feeds
  ///in user interface not use this method please use getMyFeeds method
  ///is a private value
  final List<FeedModel> _myFeeds = [];
  //this method is used for current user free feeds active and inactive both
  Future<List<FeedModel>> get myActiveAndInactiveFreeFeeds async {
    if (_myFeeds.isEmpty) await getMyFeeds();
    return _myFeeds.where((element) => element.listingType == ListingTypes.free.name).toList();
  }

  //this method is used for current user free feeds. just active
  Future<List<FeedModel>> get myActiveFreeFeeds async {
    if (_myFeeds.isEmpty) await getMyFeeds();
    return _myFeeds
        .where((element) => element.listingType == ListingTypes.free.name && element.isActive == true)
        .toList();
  }

  void clearMyFeeds() {
    _myFeeds.clear();
    notifyListeners();
  }

  //this method is used for current user tradable feeds active and inactive both
  Future<List<FeedModel>> get myActiveAndInactiveTradableFeeds async {
    if (_myFeeds.isEmpty) await getMyFeeds();
    return _myFeeds.where((element) => element.listingType == ListingTypes.tradable.name).toList();
  }

  //this method is used for current user tradable feeds. just active
  Future<List<FeedModel>> get myActiveTradableFeeds async {
    if (_myFeeds.isEmpty) await getMyFeeds();
    return _myFeeds
        .where((element) => element.listingType == ListingTypes.tradable.name && element.isActive == true)
        .toList();
  }

  ///this method is used for current user all feeds
  ///if my feeds is not empty return my feeds
  ///if my feeds is empty, fetch my feeds and return my feeds
  Future<ApiResponse<List<FeedModel>>> getMyFeeds() async {
    if (_myFeeds.isNotEmpty) {
      Log.info(
        'MyFeeds already fetched length:${_myFeeds.length}',
        path: 'Feed Repository getMyFeeds',
      );
      return ApiResponse.right(_myFeeds);
    }
    return requestMethod<List<FeedModel>>(
      path: '/active_user_listing_previews/',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => (response.data as List<dynamic>)
          .map(
            (e) => FeedModel.fromJson(e as Map<String, dynamic>).copyWith(
                /* image1: FeedModel.fromJson(e).image1 != null ? IMAGE_BASE_URL + FeedModel.fromJson(e).image1! : null, */
                ),
          )
          .toList(),
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

  ///listing type is "free" or "tradable" or "most_viewed"
  Future<ApiResponse<List<FeedModel>>> getAllListings(String listingType) async {
    return requestMethod<List<FeedModel>>(
      path: '/detailed_listings/?listing_type=$listingType&page=1&page_size=100',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => ((response.data as Map<String, dynamic>)['results'] as List<dynamic>)
          .map((e) => FeedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      headers: {'Accept': 'application/json'},
    );
  }

  Future<ApiResponse<List<FeedModel>>> getFeedByCategories(String id) async {
    return requestMethod<List<FeedModel>>(
      path: '/listings_by_category/$id?page=1&page_size=100',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => ((response.data["results"]) as List<dynamic>)
          .map((e) => FeedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      headers: {'Accept': 'application/json'},
    );
  }

  Future<ApiResponse<String>> completeListing(String listingId, ListingTypes listingType, String otherUserName) async {
    return requestMethod<String>(
      path: '/complete_listing/',
      method: HttpMethod.post,
      requestModel: {
        'listing_id': listingId,
        'listing_type': listingType.name,
        'other_username': otherUserName,
      },
      responseConverter: (response) => (response.data as Map<String, dynamic>)['success'] as String,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }

  ///tamamlanmış ilanlar
  ///ücretsiz veya takaslanarak paylaşılmış ilanlar
  ///Paylaşılan kullanıcı tarafından onay bekleyen ilanlar

  final Set<FeedDetailModel> _inactiveFeeds = {};
  Future<List<FeedDetailModel>> get allInactiveFeeds async {
    if (_inactiveFeeds.isEmpty) await _getInactiveFeeds();
    return _inactiveFeeds.toList();
  }

  //ilan aktif değil ve paylaşılan kullanıcı tarafından ücretsiz paylaşıldığı onaylanmış.
  Future<List<FeedDetailModel>> get freeInactiveFeeds async {
    if (_inactiveFeeds.isEmpty) await _getInactiveFeeds();
    return _inactiveFeeds
        .where((element) => element.listingType == ListingTypes.free.name && element.receiverConfirmed)
        .toList();
  }

  ///ilan aktif değil ve paylaşılan kullanıcı tarafından takaslandığı onaylanmış
  Future<List<FeedDetailModel>> get tradableInactiveFeeds async {
    if (_inactiveFeeds.isEmpty) await _getInactiveFeeds();
    return _inactiveFeeds
        .where((element) => element.listingType == ListingTypes.tradable.name && element.receiverConfirmed)
        .toList();
  }

  /// ilan aktif değil ve paylaşılan kullanıcı tarafından onay bekliyor
  Future<List<FeedDetailModel>> get waitingInactiveFeeds async {
    if (_inactiveFeeds.isEmpty) await _getInactiveFeeds();
    return _inactiveFeeds
        .where((element) => element.receiverConfirmed == false && element.receiverConfirmed == false)
        .toList();
  }

  void _addInactiveFeed(FeedDetailModel feedModel) {
    _inactiveFeeds.add(feedModel);
  }

  Future<ApiResponse<List<FeedDetailModel>>> _getInactiveFeeds() async {
    return requestMethod<List<FeedDetailModel>>(
      path: '/inactive_listings/',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => (response.data as List<dynamic>)
          .map(
            (e) => FeedDetailModel.fromJson(e as Map<String, dynamic>).copyWith(
                /* image1: FeedModel.fromJson(e).image1 != null ? IMAGE_BASE_URL + FeedModel.fromJson(e).image1! : null, */
                ),
          )
          .toList(),
      headers: {'Accept': 'application/json'},
    ).then((value) {
      value.fold(
        Log.error,
        (r) => {
          for (final element in r) _addInactiveFeed(element),
        },
      );
      return value;
    });
  }

 List<FeedDetailModel> _otherUserActiveFeeds = [];
  List<FeedDetailModel> _otherUserActiveFeedsFree = [];

  Future<List<FeedDetailModel>> getOtherUserActiveFeeds(String userId) async {
    _otherUserActiveFeeds.clear();
    return requestMethod<List<FeedDetailModel>>(
      path: '/active_listings/$userId',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => (response.data as List<dynamic>)
          .map(
            (e) => FeedDetailModel.fromJson(e as Map<String, dynamic>).copyWith(
                /* image1: FeedModel.fromJson(e).image1 != null ? IMAGE_BASE_URL + FeedModel.fromJson(e).image1! : null, */
                ),
          )
          .toList(),
      headers: {'Accept': 'application/json'},
    ).then((value) {
      value.fold(
        Log.error,
        (r) {
          for (final element in r) {
            if (element.listingType == ListingTypes.tradable.name) {
             _otherUserActiveFeeds.add(element);
            }
          }
        },
      );

      return _otherUserActiveFeeds ;
    });
  }
  Future<List<FeedDetailModel>> getOtherUserActiveFeedsFree(String userId) async {
    _otherUserActiveFeedsFree.clear();
    return requestMethod<List<FeedDetailModel>>(
      path: '/active_listings/$userId',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => (response.data as List<dynamic>)
          .map(
            (e) => FeedDetailModel.fromJson(e as Map<String, dynamic>).copyWith(
                /* image1: FeedModel.fromJson(e).image1 != null ? IMAGE_BASE_URL + FeedModel.fromJson(e).image1! : null, */
                ),
          )
          .toList(),
      headers: {'Accept': 'application/json'},
    ).then((value) {
      value.fold(
        Log.error,
        (r) {
          for (final element in r) {
            if (element.listingType == ListingTypes.free.name) {
              _otherUserActiveFeedsFree.add(element);
            }
          }
        },
      );

      return _otherUserActiveFeedsFree;
    });
  }

  final Set<FeedDetailModel> _waitingToConfigmFeeds = {};

  void clearWaitingToConfirmFeeds() {
    _waitingToConfigmFeeds.clear();
    notifyListeners();
  }

  ///başka bir kullanıcı tarafından uygulamayı kullanan user ın username i girilerek kullanıcının onayına sunulan ilanlar
  Future<List<FeedDetailModel>> get waitingToConfirmFeeds async {
    if (_waitingToConfigmFeeds.isEmpty) await _getWaitingToConfirmFeeds();
    return _waitingToConfigmFeeds.toList();
  }

  void _addWaitingToConfifmFeed(FeedDetailModel feedModel) {
    if (feedModel.ownerInfo.username != GetIt.instance<UserRepository>().user?.username) {
      _waitingToConfigmFeeds.add(feedModel);
      notifyListeners();
    }
  }

  Future<ApiResponse<List<FeedDetailModel>>> _getWaitingToConfirmFeeds() async {
    return requestMethod<List<FeedDetailModel>>(
      path: '/listings/to_confirm/',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => (response.data as List<dynamic>)
          .map(
            (e) => FeedDetailModel.fromJson(e as Map<String, dynamic>).copyWith(
                /* image1: FeedModel.fromJson(e).image1 != null ? IMAGE_BASE_URL + FeedModel.fromJson(e).image1! : null, */
                ),
          )
          .toList(),
      headers: {'Accept': 'application/json'},
    ).then((value) {
      value.fold(
        Log.error,
        (r) => {
          for (final element in r) _addWaitingToConfifmFeed(element),
        },
      );
      return value;
    });
  }

  Future<ApiResponse<String>> confirmToWaitingFeed(int feedid) async {
    return requestMethod<String>(
      path: '/listings/confirm/$feedid',
      method: HttpMethod.post,
      requestModel: null,
      responseConverter: (response) => (response.data as Map<String, dynamic>)['success'] as String,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<ApiResponse<String>> rejectToWaitingFeed(int feedid) async {
    return requestMethod<String>(
      path: '/listings/cancel/$feedid',
      method: HttpMethod.post,
      requestModel: null,
      responseConverter: (response) => (response.data as Map<String, dynamic>)['success'] as String,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<ApiResponse<Tuple2<List<FeedModel>, List<MainCategoryModel>>>> searchListings(String query) async {
    return requestMethod<Tuple2<List<FeedModel>, List<MainCategoryModel>>>(
      path: '/search_listings/?query=$query',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) {
        return Tuple2(
          (response.data['listings'] as List<dynamic>)
              .map((e) => FeedModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          (response.data['categories'] as List<dynamic>)
              .map((e) => MainCategoryModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
      },
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<Either<String, String>> updateFeed(String feedId, List<int> id,List<XFile> images,
      ListingTypes listingType, String title, String description, BuildContext context) async {
    const storage = FlutterSecureStorage();
    final accessToken = await storage.read(key: 'access_token');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    final request = http.MultipartRequest('PUT', Uri.parse('$BASE_URL/update_listing/$feedId/'));
    request.fields.addAll({
      'listing_type': listingType.name,
      'title': title,
      'description': description,
    });
    if (id.isNotEmpty) {
       for (final i in id) {
      request.fields.addAll({
        'delete_images': i.toString(),
      });
    }
    }else{
      request.fields.addAll({
        'delete_images': 0.toString(),
      });
    }

   if (images.isNotEmpty) {
    for (final image in images) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'new_images',
          image.path,
        ),
      );
        }
     
   }

    

    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200) {
      Log.success(await response.stream.bytesToString());
      //yeni feed eklendiğinde myFeeds listesinin güncellenmesi için myFeeds listesini temizliyoruz
      _myFeeds.clear();
      await EasyLoading.dismiss();
      notifyListeners();
      Navigator.pop(context);
      return Right((jsonDecode(await response.stream.bytesToString()) as Map<String, dynamic>)['success'] as String);
    } else {
      Log.error(response.reasonPhrase);
      return Left(response.reasonPhrase ?? 'Error');
    }
  }
}
