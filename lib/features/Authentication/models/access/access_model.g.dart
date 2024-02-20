// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccessModelImpl _$$AccessModelImplFromJson(Map<String, dynamic> json) =>
    _$AccessModelImpl(
      access: json['access'] as String?,
      success: json['success'] as String?,
    );

Map<String, dynamic> _$$AccessModelImplToJson(_$AccessModelImpl instance) =>
    <String, dynamic>{
      'access': instance.access,
      'success': instance.success,
    };

_$VerifyLoginResponseModelImpl _$$VerifyLoginResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyLoginResponseModelImpl(
      error: json['error'] as String?,
      success: json['success'] as String?,
    );

Map<String, dynamic> _$$VerifyLoginResponseModelImplToJson(
        _$VerifyLoginResponseModelImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'success': instance.success,
    };
