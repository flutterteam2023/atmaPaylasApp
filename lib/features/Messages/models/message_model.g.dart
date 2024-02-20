// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      isMyMessage: json['isMyMessage'] as bool,
      message: json['message'] as String,
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      messageId: json['messageId'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'isMyMessage': instance.isMyMessage,
      'message': instance.message,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'messageId': instance.messageId,
      'timestamp': instance.timestamp.toIso8601String(),
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.video: 'video',
  MessageType.audio: 'audio',
  MessageType.file: 'file',
};
