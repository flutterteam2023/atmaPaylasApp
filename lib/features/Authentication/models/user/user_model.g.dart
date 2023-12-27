// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userId: json['user_id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      userLocatedCity: json['user_located_city'] as String,
      userLocatedDistrict: json['user_located_district'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'name': instance.name,
      'surname': instance.surname,
      'user_located_city': instance.userLocatedCity,
      'user_located_district': instance.userLocatedDistrict,
      'image': instance.image,
    };
