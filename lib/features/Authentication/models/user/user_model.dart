// ignore_for_file: invalid_annotation_target, lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'surname') required String surname,
    @JsonKey(name: 'user_located_city') required String userLocatedCity,
    @JsonKey(name: 'user_located_district') required String userLocatedDistrict,
    @JsonKey(name: 'active_listings_count') required int activeListingsCount,
    @JsonKey(name: 'non_active_free_listings_count') required int nonActiveFreeListingsCount,
    @JsonKey(name: 'non_active_tradable_listings_count') required int nonActiveTradableListingsCount,
    @JsonKey(name: 'image') required String? image,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json).copyWith(
        image: json['image'] != null ? '$IMAGE_BASE_URL${json['image']}' : null,
      );
}
