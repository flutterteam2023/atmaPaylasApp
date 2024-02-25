// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archived_feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArchiveFeedModel _$ArchiveFeedModelFromJson(Map<String, dynamic> json) {
  return _ArchiveFeedModel.fromJson(json);
}

/// @nodoc
mixin _$ArchiveFeedModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_info')
  OwnerInfo get ownerInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  int get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'listing_type')
  String get listingType => throw _privateConstructorUsedError;
  @JsonKey(name: 'image1')
  String? get image1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'image2')
  String? get image2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'image3')
  String? get image3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_count')
  int get viewCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_archived')
  bool get isArchived => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArchiveFeedModelCopyWith<ArchiveFeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArchiveFeedModelCopyWith<$Res> {
  factory $ArchiveFeedModelCopyWith(
          ArchiveFeedModel value, $Res Function(ArchiveFeedModel) then) =
      _$ArchiveFeedModelCopyWithImpl<$Res, ArchiveFeedModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'owner_info') OwnerInfo ownerInfo,
      @JsonKey(name: 'category') int category,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'listing_type') String listingType,
      @JsonKey(name: 'image1') String? image1,
      @JsonKey(name: 'image2') String? image2,
      @JsonKey(name: 'image3') String? image3,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'view_count') int viewCount,
      @JsonKey(name: 'is_archived') bool isArchived,
      @JsonKey(name: 'created_at') DateTime createdAt});

  $OwnerInfoCopyWith<$Res> get ownerInfo;
}

/// @nodoc
class _$ArchiveFeedModelCopyWithImpl<$Res, $Val extends ArchiveFeedModel>
    implements $ArchiveFeedModelCopyWith<$Res> {
  _$ArchiveFeedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerInfo = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? listingType = null,
    Object? image1 = freezed,
    Object? image2 = freezed,
    Object? image3 = freezed,
    Object? isActive = null,
    Object? viewCount = null,
    Object? isArchived = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ownerInfo: null == ownerInfo
          ? _value.ownerInfo
          : ownerInfo // ignore: cast_nullable_to_non_nullable
              as OwnerInfo,
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
      image1: freezed == image1
          ? _value.image1
          : image1 // ignore: cast_nullable_to_non_nullable
              as String?,
      image2: freezed == image2
          ? _value.image2
          : image2 // ignore: cast_nullable_to_non_nullable
              as String?,
      image3: freezed == image3
          ? _value.image3
          : image3 // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$ArchiveFeedModelImplCopyWith<$Res>
    implements $ArchiveFeedModelCopyWith<$Res> {
  factory _$$ArchiveFeedModelImplCopyWith(_$ArchiveFeedModelImpl value,
          $Res Function(_$ArchiveFeedModelImpl) then) =
      __$$ArchiveFeedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'owner_info') OwnerInfo ownerInfo,
      @JsonKey(name: 'category') int category,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'listing_type') String listingType,
      @JsonKey(name: 'image1') String? image1,
      @JsonKey(name: 'image2') String? image2,
      @JsonKey(name: 'image3') String? image3,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'view_count') int viewCount,
      @JsonKey(name: 'is_archived') bool isArchived,
      @JsonKey(name: 'created_at') DateTime createdAt});

  @override
  $OwnerInfoCopyWith<$Res> get ownerInfo;
}

/// @nodoc
class __$$ArchiveFeedModelImplCopyWithImpl<$Res>
    extends _$ArchiveFeedModelCopyWithImpl<$Res, _$ArchiveFeedModelImpl>
    implements _$$ArchiveFeedModelImplCopyWith<$Res> {
  __$$ArchiveFeedModelImplCopyWithImpl(_$ArchiveFeedModelImpl _value,
      $Res Function(_$ArchiveFeedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerInfo = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? listingType = null,
    Object? image1 = freezed,
    Object? image2 = freezed,
    Object? image3 = freezed,
    Object? isActive = null,
    Object? viewCount = null,
    Object? isArchived = null,
    Object? createdAt = null,
  }) {
    return _then(_$ArchiveFeedModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ownerInfo: null == ownerInfo
          ? _value.ownerInfo
          : ownerInfo // ignore: cast_nullable_to_non_nullable
              as OwnerInfo,
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
      image1: freezed == image1
          ? _value.image1
          : image1 // ignore: cast_nullable_to_non_nullable
              as String?,
      image2: freezed == image2
          ? _value.image2
          : image2 // ignore: cast_nullable_to_non_nullable
              as String?,
      image3: freezed == image3
          ? _value.image3
          : image3 // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArchiveFeedModelImpl implements _ArchiveFeedModel {
  const _$ArchiveFeedModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'owner_info') required this.ownerInfo,
      @JsonKey(name: 'category') required this.category,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'listing_type') required this.listingType,
      @JsonKey(name: 'image1') required this.image1,
      @JsonKey(name: 'image2') required this.image2,
      @JsonKey(name: 'image3') required this.image3,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'view_count') required this.viewCount,
      @JsonKey(name: 'is_archived') required this.isArchived,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$ArchiveFeedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArchiveFeedModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'owner_info')
  final OwnerInfo ownerInfo;
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
  @override
  @JsonKey(name: 'image1')
  final String? image1;
  @override
  @JsonKey(name: 'image2')
  final String? image2;
  @override
  @JsonKey(name: 'image3')
  final String? image3;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'view_count')
  final int viewCount;
  @override
  @JsonKey(name: 'is_archived')
  final bool isArchived;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'ArchiveFeedModel(id: $id, ownerInfo: $ownerInfo, category: $category, title: $title, description: $description, listingType: $listingType, image1: $image1, image2: $image2, image3: $image3, isActive: $isActive, viewCount: $viewCount, isArchived: $isArchived, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArchiveFeedModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerInfo, ownerInfo) ||
                other.ownerInfo == ownerInfo) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            (identical(other.image1, image1) || other.image1 == image1) &&
            (identical(other.image2, image2) || other.image2 == image2) &&
            (identical(other.image3, image3) || other.image3 == image3) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerInfo,
      category,
      title,
      description,
      listingType,
      image1,
      image2,
      image3,
      isActive,
      viewCount,
      isArchived,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArchiveFeedModelImplCopyWith<_$ArchiveFeedModelImpl> get copyWith =>
      __$$ArchiveFeedModelImplCopyWithImpl<_$ArchiveFeedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArchiveFeedModelImplToJson(
      this,
    );
  }
}

abstract class _ArchiveFeedModel implements ArchiveFeedModel {
  const factory _ArchiveFeedModel(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'owner_info') required final OwnerInfo ownerInfo,
          @JsonKey(name: 'category') required final int category,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'description') required final String description,
          @JsonKey(name: 'listing_type') required final String listingType,
          @JsonKey(name: 'image1') required final String? image1,
          @JsonKey(name: 'image2') required final String? image2,
          @JsonKey(name: 'image3') required final String? image3,
          @JsonKey(name: 'is_active') required final bool isActive,
          @JsonKey(name: 'view_count') required final int viewCount,
          @JsonKey(name: 'is_archived') required final bool isArchived,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$ArchiveFeedModelImpl;

  factory _ArchiveFeedModel.fromJson(Map<String, dynamic> json) =
      _$ArchiveFeedModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'owner_info')
  OwnerInfo get ownerInfo;
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
  @JsonKey(name: 'image1')
  String? get image1;
  @override
  @JsonKey(name: 'image2')
  String? get image2;
  @override
  @JsonKey(name: 'image3')
  String? get image3;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'view_count')
  int get viewCount;
  @override
  @JsonKey(name: 'is_archived')
  bool get isArchived;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ArchiveFeedModelImplCopyWith<_$ArchiveFeedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
