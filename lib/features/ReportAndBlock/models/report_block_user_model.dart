import 'package:atma_paylas_app/api/api_service.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'report_block_user_model.freezed.dart';
part 'report_block_user_model.g.dart';

@freezed
class ReportBlockUserModel with _$ReportBlockUserModel {
  const factory ReportBlockUserModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'surname') required String surname,
    @JsonKey(name: 'profile_image') required String? profileImage,
    @JsonKey(name: 'user_located_district') required String userLocatedDistrict,
    @JsonKey(name: 'user_located_city') required String userLocatedCity,
  }) = _ReportBlockUserModel;

  factory ReportBlockUserModel.fromJson(Map<String, dynamic> json) => _$ReportBlockUserModelFromJson(json).copyWith(
        profileImage: json['profile_image'] == null ? null : "$IMAGE_BASE_URL${json['profile_image']}",
      );
}
