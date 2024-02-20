// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_model.freezed.dart';
part 'access_model.g.dart';

@freezed
class AccessModel with _$AccessModel {
  const factory AccessModel({
    @JsonKey(name: "access") required String? access,
    @JsonKey(name: "success") required String? success,


  }) = _AccessModel;

  factory AccessModel.fromJson(Map<String, dynamic> json) => _$AccessModelFromJson(json);
}
@freezed
class VerifyLoginResponseModel with _$VerifyLoginResponseModel {
  const factory VerifyLoginResponseModel({
    @JsonKey(name: "error") required String? error,
    @JsonKey(name: "success") required String? success,


  }) = _VerifyLoginResponseModel;

  factory VerifyLoginResponseModel.fromJson(Map<String, dynamic> json) => _$VerifyLoginResponseModelFromJson(json);
}

