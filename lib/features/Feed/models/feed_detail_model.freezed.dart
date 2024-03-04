// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedDetailModel _$FeedDetailModelFromJson(Map<String, dynamic> json) {
  return _FeedDetailModel.fromJson(json);
}

/// @nodoc
mixin _$FeedDetailModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  int get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'listing_type')
  String get listingType => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  List<AdsImage> get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_count')
  int get viewCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiver_user')
  int? get receiverUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiver_confirmed')
  bool get receiverConfirmed => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_archived')
  bool get isArchived => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_info')
  OwnerInfo get ownerInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedDetailModelCopyWith<FeedDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedDetailModelCopyWith<$Res> {
  factory $FeedDetailModelCopyWith(
          FeedDetailModel value, $Res Function(FeedDetailModel) then) =
      _$FeedDetailModelCopyWithImpl<$Res, FeedDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'category') int category,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'listing_type') String listingType,
      @JsonKey(name: 'images') List<AdsImage> images,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'view_count') int viewCount,
      @JsonKey(name: 'receiver_user') int? receiverUser,
      @JsonKey(name: 'receiver_confirmed') bool receiverConfirmed,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'is_archived') bool isArchived,
      @JsonKey(name: 'owner_info') OwnerInfo ownerInfo});

  $OwnerInfoCopyWith<$Res> get ownerInfo;
}

/// @nodoc
class _$FeedDetailModelCopyWithImpl<$Res, $Val extends FeedDetailModel>
    implements $FeedDetailModelCopyWith<$Res> {
  _$FeedDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? listingType = null,
    Object? images = null,
    Object? isActive = null,
    Object? viewCount = null,
    Object? receiverUser = freezed,
    Object? receiverConfirmed = null,
    Object? createdAt = null,
    Object? isArchived = null,
    Object? ownerInfo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<AdsImage>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      receiverUser: freezed == receiverUser
          ? _value.receiverUser
          : receiverUser // ignore: cast_nullable_to_non_nullable
              as int?,
      receiverConfirmed: null == receiverConfirmed
          ? _value.receiverConfirmed
          : receiverConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      ownerInfo: null == ownerInfo
          ? _value.ownerInfo
          : ownerInfo // ignore: cast_nullable_to_non_nullable
              as OwnerInfo,
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
abstract class _$$FeedDetailModelImplCopyWith<$Res>
    implements $FeedDetailModelCopyWith<$Res> {
  factory _$$FeedDetailModelImplCopyWith(_$FeedDetailModelImpl value,
          $Res Function(_$FeedDetailModelImpl) then) =
      __$$FeedDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'category') int category,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'listing_type') String listingType,
      @JsonKey(name: 'images') List<AdsImage> images,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'view_count') int viewCount,
      @JsonKey(name: 'receiver_user') int? receiverUser,
      @JsonKey(name: 'receiver_confirmed') bool receiverConfirmed,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'is_archived') bool isArchived,
      @JsonKey(name: 'owner_info') OwnerInfo ownerInfo});

  @override
  $OwnerInfoCopyWith<$Res> get ownerInfo;
}

/// @nodoc
class __$$FeedDetailModelImplCopyWithImpl<$Res>
    extends _$FeedDetailModelCopyWithImpl<$Res, _$FeedDetailModelImpl>
    implements _$$FeedDetailModelImplCopyWith<$Res> {
  __$$FeedDetailModelImplCopyWithImpl(
      _$FeedDetailModelImpl _value, $Res Function(_$FeedDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? listingType = null,
    Object? images = null,
    Object? isActive = null,
    Object? viewCount = null,
    Object? receiverUser = freezed,
    Object? receiverConfirmed = null,
    Object? createdAt = null,
    Object? isArchived = null,
    Object? ownerInfo = null,
  }) {
    return _then(_$FeedDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<AdsImage>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      receiverUser: freezed == receiverUser
          ? _value.receiverUser
          : receiverUser // ignore: cast_nullable_to_non_nullable
              as int?,
      receiverConfirmed: null == receiverConfirmed
          ? _value.receiverConfirmed
          : receiverConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      ownerInfo: null == ownerInfo
          ? _value.ownerInfo
          : ownerInfo // ignore: cast_nullable_to_non_nullable
              as OwnerInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedDetailModelImpl implements _FeedDetailModel {
  const _$FeedDetailModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'category') required this.category,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'listing_type') required this.listingType,
      @JsonKey(name: 'images') required final List<AdsImage> images,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'view_count') required this.viewCount,
      @JsonKey(name: 'receiver_user') required this.receiverUser,
      @JsonKey(name: 'receiver_confirmed') required this.receiverConfirmed,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'is_archived') required this.isArchived,
      @JsonKey(name: 'owner_info') this.ownerInfo = const OwnerInfo(
          userId: null,
          username: null,
          name: null,
          surname: null,
          city: null,
          district: null,
          profileImage: null,
          phoneNumber: null)})
      : _images = images;

  factory _$FeedDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'category')
  final int category;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'listing_type')
  final String listingType;
  final List<AdsImage> _images;
  @override
  @JsonKey(name: 'images')
  List<AdsImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'view_count')
  final int viewCount;
  @override
  @JsonKey(name: 'receiver_user')
  final int? receiverUser;
  @override
  @JsonKey(name: 'receiver_confirmed')
  final bool receiverConfirmed;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'is_archived')
  final bool isArchived;
  @override
  @JsonKey(name: 'owner_info')
  final OwnerInfo ownerInfo;

  @override
  String toString() {
    return 'FeedDetailModel(id: $id, category: $category, title: $title, description: $description, listingType: $listingType, images: $images, isActive: $isActive, viewCount: $viewCount, receiverUser: $receiverUser, receiverConfirmed: $receiverConfirmed, createdAt: $createdAt, isArchived: $isArchived, ownerInfo: $ownerInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.receiverUser, receiverUser) ||
                other.receiverUser == receiverUser) &&
            (identical(other.receiverConfirmed, receiverConfirmed) ||
                other.receiverConfirmed == receiverConfirmed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.ownerInfo, ownerInfo) ||
                other.ownerInfo == ownerInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      title,
      description,
      listingType,
      const DeepCollectionEquality().hash(_images),
      isActive,
      viewCount,
      receiverUser,
      receiverConfirmed,
      createdAt,
      isArchived,
      ownerInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedDetailModelImplCopyWith<_$FeedDetailModelImpl> get copyWith =>
      __$$FeedDetailModelImplCopyWithImpl<_$FeedDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedDetailModelImplToJson(
      this,
    );
  }
}

abstract class _FeedDetailModel implements FeedDetailModel {
  const factory _FeedDetailModel(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'category') required final int category,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'description') required final String description,
          @JsonKey(name: 'listing_type') required final String listingType,
          @JsonKey(name: 'images') required final List<AdsImage> images,
          @JsonKey(name: 'is_active') required final bool isActive,
          @JsonKey(name: 'view_count') required final int viewCount,
          @JsonKey(name: 'receiver_user') required final int? receiverUser,
          @JsonKey(name: 'receiver_confirmed')
          required final bool receiverConfirmed,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'is_archived') required final bool isArchived,
          @JsonKey(name: 'owner_info') final OwnerInfo ownerInfo}) =
      _$FeedDetailModelImpl;

  factory _FeedDetailModel.fromJson(Map<String, dynamic> json) =
      _$FeedDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'category')
  int get category;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'listing_type')
  String get listingType;
  @override
  @JsonKey(name: 'images')
  List<AdsImage> get images;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'view_count')
  int get viewCount;
  @override
  @JsonKey(name: 'receiver_user')
  int? get receiverUser;
  @override
  @JsonKey(name: 'receiver_confirmed')
  bool get receiverConfirmed;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'is_archived')
  bool get isArchived;
  @override
  @JsonKey(name: 'owner_info')
  OwnerInfo get ownerInfo;
  @override
  @JsonKey(ignore: true)
  _$$FeedDetailModelImplCopyWith<_$FeedDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdsImage _$AdsImageFromJson(Map<String, dynamic> json) {
  return _AdsImage.fromJson(json);
}

/// @nodoc
mixin _$AdsImage {
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdsImageCopyWith<AdsImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdsImageCopyWith<$Res> {
  factory $AdsImageCopyWith(AdsImage value, $Res Function(AdsImage) then) =
      _$AdsImageCopyWithImpl<$Res, AdsImage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'image') String image, @JsonKey(name: 'id') int id});
}

/// @nodoc
class _$AdsImageCopyWithImpl<$Res, $Val extends AdsImage>
    implements $AdsImageCopyWith<$Res> {
  _$AdsImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdsImageImplCopyWith<$Res>
    implements $AdsImageCopyWith<$Res> {
  factory _$$AdsImageImplCopyWith(
          _$AdsImageImpl value, $Res Function(_$AdsImageImpl) then) =
      __$$AdsImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'image') String image, @JsonKey(name: 'id') int id});
}

/// @nodoc
class __$$AdsImageImplCopyWithImpl<$Res>
    extends _$AdsImageCopyWithImpl<$Res, _$AdsImageImpl>
    implements _$$AdsImageImplCopyWith<$Res> {
  __$$AdsImageImplCopyWithImpl(
      _$AdsImageImpl _value, $Res Function(_$AdsImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? id = null,
  }) {
    return _then(_$AdsImageImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdsImageImpl implements _AdsImage {
  const _$AdsImageImpl(
      {@JsonKey(name: 'image') required this.image,
      @JsonKey(name: 'id') required this.id});

  factory _$AdsImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdsImageImplFromJson(json);

  @override
  @JsonKey(name: 'image')
  final String image;
  @override
  @JsonKey(name: 'id')
  final int id;

  @override
  String toString() {
    return 'AdsImage(image: $image, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdsImageImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdsImageImplCopyWith<_$AdsImageImpl> get copyWith =>
      __$$AdsImageImplCopyWithImpl<_$AdsImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdsImageImplToJson(
      this,
    );
  }
}

abstract class _AdsImage implements AdsImage {
  const factory _AdsImage(
      {@JsonKey(name: 'image') required final String image,
      @JsonKey(name: 'id') required final int id}) = _$AdsImageImpl;

  factory _AdsImage.fromJson(Map<String, dynamic> json) =
      _$AdsImageImpl.fromJson;

  @override
  @JsonKey(name: 'image')
  String get image;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$AdsImageImplCopyWith<_$AdsImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
