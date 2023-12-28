// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainCategoryModelImpl _$$MainCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MainCategoryModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      hasSubcategories: json['has_subcategories'] as bool,
    );

Map<String, dynamic> _$$MainCategoryModelImplToJson(
        _$MainCategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'has_subcategories': instance.hasSubcategories,
    };
