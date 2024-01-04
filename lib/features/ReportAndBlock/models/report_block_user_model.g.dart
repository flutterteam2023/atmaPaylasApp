// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_block_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportBlockUserModelImpl _$$ReportBlockUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportBlockUserModelImpl(
      id: json['id'] as int,
      username: json['username'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      profileImage: json['profile_image'] as String?,
      userLocatedDistrict: json['user_located_district'] as String,
      userLocatedCity: json['user_located_city'] as String,
    );

Map<String, dynamic> _$$ReportBlockUserModelImplToJson(
        _$ReportBlockUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'surname': instance.surname,
      'profile_image': instance.profileImage,
      'user_located_district': instance.userLocatedDistrict,
      'user_located_city': instance.userLocatedCity,
    };
