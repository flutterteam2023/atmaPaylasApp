// ignore_for_file: invalid_annotation_target, lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing_model.freezed.dart';
part 'listing_model.g.dart';

@freezed
class ListingModel with _$ListingModel {
  const factory ListingModel({
    @JsonKey(name: 'listing_id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'listing_type') required String listingType,
    @JsonKey(name: 'image1_url') required String? image1Url,
  }) = _ListingModel;

  factory ListingModel.fromJson(Map<String, dynamic> json) => _$ListingModelFromJson(json).copyWith(
        image1Url: json['image1_url'] == null ? null : '$IMAGE_BASE_URL${json['image1_url']}',
      );
}
