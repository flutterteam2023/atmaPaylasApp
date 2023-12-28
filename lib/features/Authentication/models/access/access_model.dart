// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_model.freezed.dart';
part 'access_model.g.dart';

@freezed
class AccessModel with _$AccessModel {
  const factory AccessModel({
    @JsonKey(name: "access") required String access,
  }) = _AccessModel;

  factory AccessModel.fromJson(Map<String, dynamic> json) => _$AccessModelFromJson(json);
}
