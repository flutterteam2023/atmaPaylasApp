// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserMessageImpl _$$UserMessageImplFromJson(Map<String, dynamic> json) =>
    _$UserMessageImpl(
      username: json['username'] as String,
      content: Content.fromJson(json['content'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String,
      otherUsername: json['other_username'] as String?,
    );

Map<String, dynamic> _$$UserMessageImplToJson(_$UserMessageImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'content': instance.content,
      'timestamp': instance.timestamp,
      'other_username': instance.otherUsername,
    };

_$ContentImpl _$$ContentImplFromJson(Map<String, dynamic> json) =>
    _$ContentImpl(
      type: json['type'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$ContentImplToJson(_$ContentImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
    };
