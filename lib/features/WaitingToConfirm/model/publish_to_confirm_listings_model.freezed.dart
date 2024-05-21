// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publish_to_confirm_listings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublishToConfirmListingsModel _$PublishToConfirmListingsModelFromJson(
    Map<String, dynamic> json) {
  return _PublishToConfirmListingsModel.fromJson(json);
}

/// @nodoc
mixin _$PublishToConfirmListingsModel {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user")
  int get user => throw _privateConstructorUsedError;
  @JsonKey(name: "owner_info")
  OwnerInfo get ownerInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "category")
  int get category => throw _privateConstructorUsedError;
  @JsonKey(name: "category_path")
  String get categoryPath => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "listing_type")
  String get listingType => throw _privateConstructorUsedError;
  @JsonKey(name: "image1")
  String? get image1 => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "admin_confirmed")
  bool get adminConfirmed => throw _privateConstructorUsedError;
  @JsonKey(name: "view_count")
  int get viewCount => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "is_archived")
  bool get isArchived => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublishToConfirmListingsModelCopyWith<PublishToConfirmListingsModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublishToConfirmListingsModelCopyWith<$Res> {
  factory $PublishToConfirmListingsModelCopyWith(
          PublishToConfirmListingsModel value,
          $Res Function(PublishToConfirmListingsModel) then) =
      _$PublishToConfirmListingsModelCopyWithImpl<$Res,
          PublishToConfirmListingsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "user") int user,
      @JsonKey(name: "owner_info") OwnerInfo ownerInfo,
      @JsonKey(name: "category") int category,
      @JsonKey(name: "category_path") String categoryPath,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "listing_type") String listingType,
      @JsonKey(name: "image1") String? image1,
      @JsonKey(name: "is_active") bool isActive,
      @JsonKey(name: "admin_confirmed") bool adminConfirmed,
      @JsonKey(name: "view_count") int viewCount,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "is_archived") bool isArchived});

  $OwnerInfoCopyWith<$Res> get ownerInfo;
}

/// @nodoc
class _$PublishToConfirmListingsModelCopyWithImpl<$Res,
        $Val extends PublishToConfirmListingsModel>
    implements $PublishToConfirmListingsModelCopyWith<$Res> {
  _$PublishToConfirmListingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? ownerInfo = null,
    Object? category = null,
    Object? categoryPath = null,
    Object? title = null,
    Object? listingType = null,
    Object? image1 = freezed,
    Object? isActive = null,
    Object? adminConfirmed = null,
    Object? viewCount = null,
    Object? createdAt = null,
    Object? isArchived = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int,
      ownerInfo: null == ownerInfo
          ? _value.ownerInfo
          : ownerInfo // ignore: cast_nullable_to_non_nullable
              as OwnerInfo,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      categoryPath: null == categoryPath
          ? _value.categoryPath
          : categoryPath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String,
      image1: freezed == image1
          ? _value.image1
          : image1 // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      adminConfirmed: null == adminConfirmed
          ? _value.adminConfirmed
          : adminConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OwnerInfoCopyWith<$Res> get ownerInfo {
    return $OwnerInfoCopyWith<$Res>(_value.ownerInfo, (value) {
      return _then(_value.copyWith(ownerInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PublishToConfirmListingsModelImplCopyWith<$Res>
    implements $PublishToConfirmListingsModelCopyWith<$Res> {
  factory _$$PublishToConfirmListingsModelImplCopyWith(
          _$PublishToConfirmListingsModelImpl value,
          $Res Function(_$PublishToConfirmListingsModelImpl) then) =
      __$$PublishToConfirmListingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "user") int user,
      @JsonKey(name: "owner_info") OwnerInfo ownerInfo,
      @JsonKey(name: "category") int category,
      @JsonKey(name: "category_path") String categoryPath,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "listing_type") String listingType,
      @JsonKey(name: "image1") String? image1,
      @JsonKey(name: "is_active") bool isActive,
      @JsonKey(name: "admin_confirmed") bool adminConfirmed,
      @JsonKey(name: "view_count") int viewCount,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "is_archived") bool isArchived});

  @override
  $OwnerInfoCopyWith<$Res> get ownerInfo;
}

/// @nodoc
class __$$PublishToConfirmListingsModelImplCopyWithImpl<$Res>
    extends _$PublishToConfirmListingsModelCopyWithImpl<$Res,
        _$PublishToConfirmListingsModelImpl>
    implements _$$PublishToConfirmListingsModelImplCopyWith<$Res> {
  __$$PublishToConfirmListingsModelImplCopyWithImpl(
      _$PublishToConfirmListingsModelImpl _value,
      $Res Function(_$PublishToConfirmListingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? ownerInfo = null,
    Object? category = null,
    Object? categoryPath = null,
    Object? title = null,
    Object? listingType = null,
    Object? image1 = freezed,
    Object? isActive = null,
    Object? adminConfirmed = null,
    Object? viewCount = null,
    Object? createdAt = null,
    Object? isArchived = null,
  }) {
    return _then(_$PublishToConfirmListingsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int,
      ownerInfo: null == ownerInfo
          ? _value.ownerInfo
          : ownerInfo // ignore: cast_nullable_to_non_nullable
              as OwnerInfo,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      categoryPath: null == categoryPath
          ? _value.categoryPath
          : categoryPath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String,
      image1: freezed == image1
          ? _value.image1
          : image1 // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      adminConfirmed: null == adminConfirmed
          ? _value.adminConfirmed
          : adminConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublishToConfirmListingsModelImpl
    implements _PublishToConfirmListingsModel {
  const _$PublishToConfirmListingsModelImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "user") required this.user,
      @JsonKey(name: "owner_info") required this.ownerInfo,
      @JsonKey(name: "category") required this.category,
      @JsonKey(name: "category_path") required this.categoryPath,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "listing_type") required this.listingType,
      @JsonKey(name: "image1") required this.image1,
      @JsonKey(name: "is_active") required this.isActive,
      @JsonKey(name: "admin_confirmed") required this.adminConfirmed,
      @JsonKey(name: "view_count") required this.viewCount,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "is_archived") required this.isArchived});

  factory _$PublishToConfirmListingsModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PublishToConfirmListingsModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "user")
  final int user;
  @override
  @JsonKey(name: "owner_info")
  final OwnerInfo ownerInfo;
  @override
  @JsonKey(name: "category")
  final int category;
  @override
  @JsonKey(name: "category_path")
  final String categoryPath;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "listing_type")
  final String listingType;
  @override
  @JsonKey(name: "image1")
  final String? image1;
  @override
  @JsonKey(name: "is_active")
  final bool isActive;
  @override
  @JsonKey(name: "admin_confirmed")
  final bool adminConfirmed;
  @override
  @JsonKey(name: "view_count")
  final int viewCount;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: "is_archived")
  final bool isArchived;

  @override
  String toString() {
    return 'PublishToConfirmListingsModel(id: $id, user: $user, ownerInfo: $ownerInfo, category: $category, categoryPath: $categoryPath, title: $title, listingType: $listingType, image1: $image1, isActive: $isActive, adminConfirmed: $adminConfirmed, viewCount: $viewCount, createdAt: $createdAt, isArchived: $isArchived)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublishToConfirmListingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.ownerInfo, ownerInfo) ||
                other.ownerInfo == ownerInfo) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.categoryPath, categoryPath) ||
                other.categoryPath == categoryPath) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            (identical(other.image1, image1) || other.image1 == image1) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.adminConfirmed, adminConfirmed) ||
                other.adminConfirmed == adminConfirmed) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      ownerInfo,
      category,
      categoryPath,
      title,
      listingType,
      image1,
      isActive,
      adminConfirmed,
      viewCount,
      createdAt,
      isArchived);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublishToConfirmListingsModelImplCopyWith<
          _$PublishToConfirmListingsModelImpl>
      get copyWith => __$$PublishToConfirmListingsModelImplCopyWithImpl<
          _$PublishToConfirmListingsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublishToConfirmListingsModelImplToJson(
      this,
    );
  }
}

abstract class _PublishToConfirmListingsModel
    implements PublishToConfirmListingsModel {
  const factory _PublishToConfirmListingsModel(
          {@JsonKey(name: "id") required final int id,
          @JsonKey(name: "user") required final int user,
          @JsonKey(name: "owner_info") required final OwnerInfo ownerInfo,
          @JsonKey(name: "category") required final int category,
          @JsonKey(name: "category_path") required final String categoryPath,
          @JsonKey(name: "title") required final String title,
          @JsonKey(name: "listing_type") required final String listingType,
          @JsonKey(name: "image1") required final String? image1,
          @JsonKey(name: "is_active") required final bool isActive,
          @JsonKey(name: "admin_confirmed") required final bool adminConfirmed,
          @JsonKey(name: "view_count") required final int viewCount,
          @JsonKey(name: "created_at") required final DateTime createdAt,
          @JsonKey(name: "is_archived") required final bool isArchived}) =
      _$PublishToConfirmListingsModelImpl;

  factory _PublishToConfirmListingsModel.fromJson(Map<String, dynamic> json) =
      _$PublishToConfirmListingsModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "user")
  int get user;
  @override
  @JsonKey(name: "owner_info")
  OwnerInfo get ownerInfo;
  @override
  @JsonKey(name: "category")
  int get category;
  @override
  @JsonKey(name: "category_path")
  String get categoryPath;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "listing_type")
  String get listingType;
  @override
  @JsonKey(name: "image1")
  String? get image1;
  @override
  @JsonKey(name: "is_active")
  bool get isActive;
  @override
  @JsonKey(name: "admin_confirmed")
  bool get adminConfirmed;
  @override
  @JsonKey(name: "view_count")
  int get viewCount;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(name: "is_archived")
  bool get isArchived;
  @override
  @JsonKey(ignore: true)
  _$$PublishToConfirmListingsModelImplCopyWith<
          _$PublishToConfirmListingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OwnerInfo _$OwnerInfoFromJson(Map<String, dynamic> json) {
  return _OwnerInfo.fromJson(json);
}

/// @nodoc
mixin _$OwnerInfo {
  @JsonKey(name: "user_id")
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "surname")
  String get surname => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: "district")
  String get district => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OwnerInfoCopyWith<OwnerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerInfoCopyWith<$Res> {
  factory $OwnerInfoCopyWith(OwnerInfo value, $Res Function(OwnerInfo) then) =
      _$OwnerInfoCopyWithImpl<$Res, OwnerInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int userId,
      @JsonKey(name: "username") String username,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "surname") String surname,
      @JsonKey(name: "city") String city,
      @JsonKey(name: "district") String district,
      @JsonKey(name: "profile_image") String profileImage,
      @JsonKey(name: "phone_number") String phoneNumber});
}

/// @nodoc
class _$OwnerInfoCopyWithImpl<$Res, $Val extends OwnerInfo>
    implements $OwnerInfoCopyWith<$Res> {
  _$OwnerInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? name = null,
    Object? surname = null,
    Object? city = null,
    Object? district = null,
    Object? profileImage = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OwnerInfoImplCopyWith<$Res>
    implements $OwnerInfoCopyWith<$Res> {
  factory _$$OwnerInfoImplCopyWith(
          _$OwnerInfoImpl value, $Res Function(_$OwnerInfoImpl) then) =
      __$$OwnerInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int userId,
      @JsonKey(name: "username") String username,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "surname") String surname,
      @JsonKey(name: "city") String city,
      @JsonKey(name: "district") String district,
      @JsonKey(name: "profile_image") String profileImage,
      @JsonKey(name: "phone_number") String phoneNumber});
}

/// @nodoc
class __$$OwnerInfoImplCopyWithImpl<$Res>
    extends _$OwnerInfoCopyWithImpl<$Res, _$OwnerInfoImpl>
    implements _$$OwnerInfoImplCopyWith<$Res> {
  __$$OwnerInfoImplCopyWithImpl(
      _$OwnerInfoImpl _value, $Res Function(_$OwnerInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? name = null,
    Object? surname = null,
    Object? city = null,
    Object? district = null,
    Object? profileImage = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$OwnerInfoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnerInfoImpl implements _OwnerInfo {
  const _$OwnerInfoImpl(
      {@JsonKey(name: "user_id") required this.userId,
      @JsonKey(name: "username") required this.username,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "surname") required this.surname,
      @JsonKey(name: "city") required this.city,
      @JsonKey(name: "district") required this.district,
      @JsonKey(name: "profile_image") required this.profileImage,
      @JsonKey(name: "phone_number") required this.phoneNumber});

  factory _$OwnerInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnerInfoImplFromJson(json);

  @override
  @JsonKey(name: "user_id")
  final int userId;
  @override
  @JsonKey(name: "username")
  final String username;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "surname")
  final String surname;
  @override
  @JsonKey(name: "city")
  final String city;
  @override
  @JsonKey(name: "district")
  final String district;
  @override
  @JsonKey(name: "profile_image")
  final String profileImage;
  @override
  @JsonKey(name: "phone_number")
  final String phoneNumber;

  @override
  String toString() {
    return 'OwnerInfo(userId: $userId, username: $username, name: $name, surname: $surname, city: $city, district: $district, profileImage: $profileImage, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnerInfoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, username, name, surname,
      city, district, profileImage, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnerInfoImplCopyWith<_$OwnerInfoImpl> get copyWith =>
      __$$OwnerInfoImplCopyWithImpl<_$OwnerInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnerInfoImplToJson(
      this,
    );
  }
}

abstract class _OwnerInfo implements OwnerInfo {
  const factory _OwnerInfo(
          {@JsonKey(name: "user_id") required final int userId,
          @JsonKey(name: "username") required final String username,
          @JsonKey(name: "name") required final String name,
          @JsonKey(name: "surname") required final String surname,
          @JsonKey(name: "city") required final String city,
          @JsonKey(name: "district") required final String district,
          @JsonKey(name: "profile_image") required final String profileImage,
          @JsonKey(name: "phone_number") required final String phoneNumber}) =
      _$OwnerInfoImpl;

  factory _OwnerInfo.fromJson(Map<String, dynamic> json) =
      _$OwnerInfoImpl.fromJson;

  @override
  @JsonKey(name: "user_id")
  int get userId;
  @override
  @JsonKey(name: "username")
  String get username;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "surname")
  String get surname;
  @override
  @JsonKey(name: "city")
  String get city;
  @override
  @JsonKey(name: "district")
  String get district;
  @override
  @JsonKey(name: "profile_image")
  String get profileImage;
  @override
  @JsonKey(name: "phone_number")
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$OwnerInfoImplCopyWith<_$OwnerInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
