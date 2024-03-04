// ignore_for_file: lines_longer_than_80_chars, invalid_annotation_target

import 'package:atma_paylas_app/features/Feed/models/feed_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_detail_model.freezed.dart';
part 'feed_detail_model.g.dart';

@freezed
class FeedDetailModel with _$FeedDetailModel {
  const factory FeedDetailModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'category') required int category,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'listing_type') required String listingType,
    @JsonKey(name: 'images') required List<AdsImage> images,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'view_count') required int viewCount,
    @JsonKey(name: 'receiver_user') required int? receiverUser,
    @JsonKey(name: 'receiver_confirmed') required bool receiverConfirmed,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'is_archived') required bool isArchived,
    @Default(
      OwnerInfo(
        userId: null,
        username: null,
        name: null,
        surname: null,
        city: null,
        district: null,
        profileImage: null,
        phoneNumber: null,
      ),
    )
    @JsonKey(name: 'owner_info')
    OwnerInfo ownerInfo,
  }) = _FeedDetailModel;

  factory FeedDetailModel.fromJson(Map<String, dynamic> json) => _$FeedDetailModelFromJson(json).copyWith(
      /*    image1: json['image1'] != null ? '$IMAGE_BASE_URL${json['image1']}' : null,
        image2: json['image2'] != null ? '$IMAGE_BASE_URL${json['image2']}' : null,
        image3: json['image3'] != null ? '$IMAGE_BASE_URL${json['image3']}' : null, */
      );
}

@freezed
class AdsImage with _$AdsImage {
  const factory AdsImage({
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'id') required int id,
  }) = _AdsImage;

  factory AdsImage.fromJson(Map<String, dynamic> json) => _$AdsImageFromJson(json).copyWith(
      /*    image1: json['image1'] != null ? '$IMAGE_BASE_URL${json['image1']}' : null,
        image2: json['image2'] != null ? '$IMAGE_BASE_URL${json['image2']}' : null,
        image3: json['image3'] != null ? '$IMAGE_BASE_URL${json['image3']}' : null, */
      );
}
