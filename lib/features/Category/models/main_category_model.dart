import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'main_category_model.freezed.dart';
part 'main_category_model.g.dart';

@freezed
class MainCategoryModel with _$MainCategoryModel {
    const factory MainCategoryModel({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "name")
        required String name,
        @JsonKey(name: "has_subcategories")
        required bool hasSubcategories,
    }) = _MainCategoryModel;

    factory MainCategoryModel.fromJson(Map<String, dynamic> json) => _$MainCategoryModelFromJson(json);
}
