// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterRequestModelImpl _$$RegisterRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterRequestModelImpl(
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      confirmation: json['confirmation'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      phoneNumber: json['phone_number'] as String,
      userLocatedCity: json['user_located_city'] as String,
      userLocatedDistrict: json['user_located_district'] as String,
    );

Map<String, dynamic> _$$RegisterRequestModelImplToJson(
        _$RegisterRequestModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'confirmation': instance.confirmation,
      'name': instance.name,
      'surname': instance.surname,
      'phone_number': instance.phoneNumber,
      'user_located_city': instance.userLocatedCity,
      'user_located_district': instance.userLocatedDistrict,
    };
