// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request_model.freezed.dart';
part 'register_request_model.g.dart';

@freezed
class RegisterRequestModel with _$RegisterRequestModel {
  const factory RegisterRequestModel({
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "password") required String password,
    @JsonKey(name: "confirmation") required String confirmation,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "surname") required String surname,
    @JsonKey(name: "phone_number") required String phoneNumber,
    @JsonKey(name: "user_located_city") required String userLocatedCity,
    @JsonKey(name: "user_located_district") required String userLocatedDistrict,
  }) = _RegisterRequestModel;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => _$RegisterRequestModelFromJson(json);
}
