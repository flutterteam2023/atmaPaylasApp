// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waitingMyAdsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaitingMyAdsModelImpl _$$WaitingMyAdsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WaitingMyAdsModelImpl(
      id: json['id'] as int,
      user: json['user'] as int,
      ownerInfo: OwnerInfo.fromJson(json['owner_info'] as Map<String, dynamic>),
      category: json['category'] as int,
      categoryPath: json['category_path'] as String,
      title: json['title'] as String,
      listingType: json['listing_type'] as String,
      image1: json['image1'] as String?,
      isActive: json['is_active'] as bool,
      adminConfirmed: json['admin_confirmed'] as bool,
      viewCount: json['view_count'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      isArchived: json['is_archived'] as bool,
    );

Map<String, dynamic> _$$WaitingMyAdsModelImplToJson(
        _$WaitingMyAdsModelImpl instance) =>
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
      'admin_confirmed': instance.adminConfirmed,
      'view_count': instance.viewCount,
      'created_at': instance.createdAt.toIso8601String(),
      'is_archived': instance.isArchived,
    };

_$OwnerInfoImpl _$$OwnerInfoImplFromJson(Map<String, dynamic> json) =>
    _$OwnerInfoImpl(
      userId: json['user_id'] as int,
      username: json['username'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      profileImage: json['profile_image'] as String,
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$$OwnerInfoImplToJson(_$OwnerInfoImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'name': instance.name,
      'surname': instance.surname,
      'city': instance.city,
      'district': instance.district,
      'profile_image': instance.profileImage,
      'phone_number': instance.phoneNumber,
    };
