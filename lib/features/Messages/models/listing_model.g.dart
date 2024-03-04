// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListingModelImpl _$$ListingModelImplFromJson(Map<String, dynamic> json) =>
    _$ListingModelImpl(
      id: json['listing_id'] as int,
      title: json['title'] as String,
      listingType: json['listing_type'] as String,
      image1Url: json['image1_url'] as String?,
    );

Map<String, dynamic> _$$ListingModelImplToJson(_$ListingModelImpl instance) =>
    <String, dynamic>{
      'listing_id': instance.id,
      'title': instance.title,
      'listing_type': instance.listingType,
      'image1_url': instance.image1Url,
    };
