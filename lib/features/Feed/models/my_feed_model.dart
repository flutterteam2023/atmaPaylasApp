// ignore_for_file: invalid_annotation_target, lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_feed_model.freezed.dart';
part 'my_feed_model.g.dart';

@freezed
class MyFeedModel with _$MyFeedModel {
  const factory MyFeedModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'user') required int user,
    @JsonKey(name: 'category') required int category,
    @JsonKey(name: 'category_path') required String categoryPath,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'listing_type') required String listingType,
    @JsonKey(name: 'image1') required String? image1,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _MyFeedModel;

  factory MyFeedModel.fromJson(Map<String, dynamic> json) => _$MyFeedModelFromJson(json).copyWith(
        image1: json['image1'] != null ? '$IMAGE_BASE_URL${json['image1']}' : null,
      );
}
