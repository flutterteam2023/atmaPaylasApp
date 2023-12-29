// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedDetailModelImpl _$$FeedDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedDetailModelImpl(
      id: json['id'] as int,
      category: json['category'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      listingType: json['listing_type'] as String,
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
      image3: json['image3'] as String?,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$$FeedDetailModelImplToJson(
        _$FeedDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'listing_type': instance.listingType,
      'image1': instance.image1,
      'image2': instance.image2,
      'image3': instance.image3,
      'is_active': instance.isActive,
    };
