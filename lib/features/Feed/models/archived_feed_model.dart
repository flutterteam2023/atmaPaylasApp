// ignore_for_file: invalid_annotation_target

import 'package:atma_paylas_app/features/Feed/models/feed_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'archived_feed_model.freezed.dart';
part 'archived_feed_model.g.dart';

@freezed
class ArchiveFeedModel with _$ArchiveFeedModel {
  const factory ArchiveFeedModel({
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
    @JsonKey(name: 'is_archived') required bool isArchived,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ArchiveFeedModel;

  factory ArchiveFeedModel.fromJson(Map<String, dynamic> json) => _$ArchiveFeedModelFromJson(json).copyWith(
      /*    image1: json['image1'] != null ? '$IMAGE_BASE_URL${json['image1']}' : null,
        image2: json['image2'] != null ? '$IMAGE_BASE_URL${json['image2']}' : null,
        image3: json['image3'] != null ? '$IMAGE_BASE_URL${json['image3']}' : null, */
      );
}
