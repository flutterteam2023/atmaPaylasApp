// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_information_for_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedInformationForChatModelImpl _$$FeedInformationForChatModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedInformationForChatModelImpl(
      listingId: json['listing_id'] as int,
      title: json['title'] as String,
      listingType: json['listing_type'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      image1Url: json['image1_url'] as String,
    );

Map<String, dynamic> _$$FeedInformationForChatModelImplToJson(
        _$FeedInformationForChatModelImpl instance) =>
    <String, dynamic>{
      'listing_id': instance.listingId,
      'title': instance.title,
      'listing_type': instance.listingType,
      'created_at': instance.createdAt.toIso8601String(),
      'image1_url': instance.image1Url,
    };
