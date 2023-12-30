// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyFeedModelImpl _$$MyFeedModelImplFromJson(Map<String, dynamic> json) =>
    _$MyFeedModelImpl(
      id: json['id'] as int,
      user: json['user'] as int,
      category: json['category'] as int,
      categoryPath: json['category_path'] as String,
      title: json['title'] as String,
      listingType: json['listing_type'] as String,
      image1: json['image1'] as String?,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$$MyFeedModelImplToJson(_$MyFeedModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'category': instance.category,
      'category_path': instance.categoryPath,
      'title': instance.title,
      'listing_type': instance.listingType,
      'image1': instance.image1,
      'is_active': instance.isActive,
    };
