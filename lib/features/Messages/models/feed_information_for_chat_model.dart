// ignore_for_file: invalid_annotation_target, lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_information_for_chat_model.freezed.dart';
part 'feed_information_for_chat_model.g.dart';

@freezed
class FeedInformationForChatModel with _$FeedInformationForChatModel {
  const factory FeedInformationForChatModel({
    @JsonKey(name: 'listing_id') required int listingId,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'listing_type') required String listingType,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'image1_url') required String? image1Url,
  }) = _FeedInformationForChatModel;

  factory FeedInformationForChatModel.fromJson(Map<String, dynamic> json) =>
      _$FeedInformationForChatModelFromJson(json).copyWith(
        image1Url: json['image1_url'] == null ? null : '$IMAGE_BASE_URL${json['image1_url']}',
      );
}
