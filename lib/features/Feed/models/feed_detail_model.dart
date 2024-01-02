// ignore_for_file: lines_longer_than_80_chars, invalid_annotation_target

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/features/Feed/models/feed_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_detail_model.freezed.dart';
part 'feed_detail_model.g.dart';

@freezed
class FeedDetailModel with _$FeedDetailModel {
  const factory FeedDetailModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'owner_info') required OwnerInfo ownerInfo,
    @JsonKey(name: 'category') required int category,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'listing_type') required String listingType,
    @JsonKey(name: 'image1') required String? image1,
    @JsonKey(name: 'image2') required String? image2,
    @JsonKey(name: 'image3') required String? image3,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'view_count') required int viewCount,
    @JsonKey(name: 'receiver_user') required int? receiverUser,
    @JsonKey(name: 'receiver_confirmed') required bool receiverConfirmed,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'is_archived') required bool isArchived,
  }) = _FeedDetailModel;

  factory FeedDetailModel.fromJson(Map<String, dynamic> json) => _$FeedDetailModelFromJson(json).copyWith(
      /*    image1: json['image1'] != null ? '$IMAGE_BASE_URL${json['image1']}' : null,
        image2: json['image2'] != null ? '$IMAGE_BASE_URL${json['image2']}' : null,
        image3: json['image3'] != null ? '$IMAGE_BASE_URL${json['image3']}' : null, */
      );
}
