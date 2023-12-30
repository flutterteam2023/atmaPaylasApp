// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedModelImpl _$$FeedModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedModelImpl(
      id: json['id'] as int,
      user: json['user'] as int,
      ownerInfo: OwnerInfo.fromJson(json['owner_info'] as Map<String, dynamic>),
      category: json['category'] as int,
      categoryPath: json['category_path'] as String,
      title: json['title'] as String,
      listingType: json['listing_type'] as String,
      image1: json['image1'] as String?,
      isActive: json['is_active'] as bool,
      viewCount: json['view_count'] as int,
      isArchived: json['is_archived'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$FeedModelImplToJson(_$FeedModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'owner_info': instance.ownerInfo,
      'category': instance.category,
      'category_path': instance.categoryPath,
      'title': instance.title,
      'listing_type': instance.listingType,
      'image1': instance.image1,
      'is_active': instance.isActive,
      'view_count': instance.viewCount,
      'is_archived': instance.isArchived,
      'created_at': instance.createdAt.toIso8601String(),
    };

_$OwnerInfoImpl _$$OwnerInfoImplFromJson(Map<String, dynamic> json) =>
    _$OwnerInfoImpl(
      username: json['username'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
    );

Map<String, dynamic> _$$OwnerInfoImplToJson(_$OwnerInfoImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'surname': instance.surname,
      'city': instance.city,
      'district': instance.district,
    };