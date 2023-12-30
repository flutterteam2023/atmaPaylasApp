// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archived_feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArchiveFeedModelImpl _$$ArchiveFeedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ArchiveFeedModelImpl(
      id: json['id'] as int,
      ownerInfo: OwnerInfo.fromJson(json['owner_info'] as Map<String, dynamic>),
      category: json['category'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      listingType: json['listing_type'] as String,
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
      image3: json['image3'] as String?,
      isActive: json['is_active'] as bool,
      viewCount: json['view_count'] as int,
      isArchived: json['is_archived'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ArchiveFeedModelImplToJson(
        _$ArchiveFeedModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_info': instance.ownerInfo,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'listing_type': instance.listingType,
      'image1': instance.image1,
      'image2': instance.image2,
      'image3': instance.image3,
      'is_active': instance.isActive,
      'view_count': instance.viewCount,
      'is_archived': instance.isArchived,
      'created_at': instance.createdAt.toIso8601String(),
    };
