// To parse this JSON data, do
//
//     final UserMessagePreviewsModel = UserMessagePreviewsModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_message_model.freezed.dart';
part 'user_message_model.g.dart';

@freezed
class UserMessage with _$UserMessage {
  const factory UserMessage({
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "content") required Content content,
    @JsonKey(name: "timestamp") required String timestamp,
    @JsonKey(name: "other_username") required String? otherUsername,
    @JsonKey(name: "url") required String? url,


  }) = _UserMessage;

  factory UserMessage.fromJson(Map<String, dynamic> json) => _$UserMessageFromJson(json);
}

@freezed
class Content with _$Content {
  const factory Content({
    @JsonKey(name: "type") required String type,
    @JsonKey(name: "text") required String text,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
}
