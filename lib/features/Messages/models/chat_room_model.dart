// ignore_for_file: invalid_annotation_target, lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@freezed
class ChatRoomModel with _$ChatRoomModel {
  const factory ChatRoomModel({
    @JsonKey(name: 'room_id') required int roomId,
    @JsonKey(name: 'latest_message') required LatestMessage? latestMessage,
    @JsonKey(name: 'other_user') required OtherUser otherUser,
    @JsonKey(name: 'listing') required Listing? listing,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) => _$ChatRoomModelFromJson(json);
}

@freezed
class LatestMessage with _$LatestMessage {
  const factory LatestMessage({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'author') required String author,
    @JsonKey(name: 'content') required String content,
    @JsonKey(name: 'timestamp') required DateTime timestamp,
  }) = _LatestMessage;

  factory LatestMessage.fromJson(Map<String, dynamic> json) => _$LatestMessageFromJson(json);
}

@freezed
class Listing with _$Listing {
  const factory Listing({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'listing_type') required String listingType,
    @JsonKey(name: 'image1_url') required String? image1Url,
  }) = _Listing;

  factory Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json).copyWith(
        image1Url: json['image1Url'] == null ? null : '$IMAGE_BASE_URL${json['image1_url']}',
      );
}

@freezed
class OtherUser with _$OtherUser {
  const factory OtherUser({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'surname') required String surname,
    @JsonKey(name: 'profile_image') required String? profileImage,
  }) = _OtherUser;

  factory OtherUser.fromJson(Map<String, dynamic> json) => _$OtherUserFromJson(json).copyWith(
        profileImage: json['profileImage'] == null ? null : '$IMAGE_BASE_URL${json['profileImage']}',
      );
}
