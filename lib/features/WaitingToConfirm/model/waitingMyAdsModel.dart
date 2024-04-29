import 'package:freezed_annotation/freezed_annotation.dart';

part 'waitingMyAdsModel.freezed.dart';
part 'waitingMyAdsModel.g.dart';

@freezed
class WaitingMyAdsModel with _$WaitingMyAdsModel {
    const factory WaitingMyAdsModel({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "user")
        required int user,
        @JsonKey(name: "owner_info")
        required OwnerInfo ownerInfo,
        @JsonKey(name: "category")
        required int category,
        @JsonKey(name: "category_path")
        required String categoryPath,
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "listing_type")
        required String listingType,
        @JsonKey(name: "image1")
        required String? image1,
        @JsonKey(name: "is_active")
        required bool isActive,
        @JsonKey(name: "admin_confirmed")
        required bool adminConfirmed,
        @JsonKey(name: "view_count")
        required int viewCount,
        @JsonKey(name: "created_at")
        required DateTime createdAt,
        @JsonKey(name: "is_archived")
        required bool isArchived,
    }) = _WaitingMyAdsModel;

    factory WaitingMyAdsModel.fromJson(Map<String, dynamic> json) => _$WaitingMyAdsModelFromJson(json);
}


@freezed
class OwnerInfo with _$OwnerInfo {
    const factory OwnerInfo({
        @JsonKey(name: "user_id")
        required int userId,
        @JsonKey(name: "username")
        required String username,
        @JsonKey(name: "name")
        required String name,
        @JsonKey(name: "surname")
        required String surname,
        @JsonKey(name: "city")
        required String city,
        @JsonKey(name: "district")
        required String district,
        @JsonKey(name: "profile_image")
        required String profileImage,
        @JsonKey(name: "phone_number")
        required String phoneNumber,
    }) = _OwnerInfo;

    factory OwnerInfo.fromJson(Map<String, dynamic> json) => _$OwnerInfoFromJson(json);
}


