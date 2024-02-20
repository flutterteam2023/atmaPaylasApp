// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_information_for_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedInformationForChatModel _$FeedInformationForChatModelFromJson(
    Map<String, dynamic> json) {
  return _FeedInformationForChatModel.fromJson(json);
}

/// @nodoc
mixin _$FeedInformationForChatModel {
  @JsonKey(name: 'listing_id')
  int get listingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'listing_type')
  String get listingType => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'image1_url')
  String? get image1Url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedInformationForChatModelCopyWith<FeedInformationForChatModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedInformationForChatModelCopyWith<$Res> {
  factory $FeedInformationForChatModelCopyWith(
          FeedInformationForChatModel value,
          $Res Function(FeedInformationForChatModel) then) =
      _$FeedInformationForChatModelCopyWithImpl<$Res,
          FeedInformationForChatModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'listing_id') int listingId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'listing_type') String listingType,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'image1_url') String? image1Url});
}

/// @nodoc
class _$FeedInformationForChatModelCopyWithImpl<$Res,
        $Val extends FeedInformationForChatModel>
    implements $FeedInformationForChatModelCopyWith<$Res> {
  _$FeedInformationForChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? title = null,
    Object? listingType = null,
    Object? createdAt = null,
    Object? image1Url = freezed,
  }) {
    return _then(_value.copyWith(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      image1Url: freezed == image1Url
          ? _value.image1Url
          : image1Url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedInformationForChatModelImplCopyWith<$Res>
    implements $FeedInformationForChatModelCopyWith<$Res> {
  factory _$$FeedInformationForChatModelImplCopyWith(
          _$FeedInformationForChatModelImpl value,
          $Res Function(_$FeedInformationForChatModelImpl) then) =
      __$$FeedInformationForChatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'listing_id') int listingId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'listing_type') String listingType,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'image1_url') String? image1Url});
}

/// @nodoc
class __$$FeedInformationForChatModelImplCopyWithImpl<$Res>
    extends _$FeedInformationForChatModelCopyWithImpl<$Res,
        _$FeedInformationForChatModelImpl>
    implements _$$FeedInformationForChatModelImplCopyWith<$Res> {
  __$$FeedInformationForChatModelImplCopyWithImpl(
      _$FeedInformationForChatModelImpl _value,
      $Res Function(_$FeedInformationForChatModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? title = null,
    Object? listingType = null,
    Object? createdAt = null,
    Object? image1Url = freezed,
  }) {
    return _then(_$FeedInformationForChatModelImpl(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      image1Url: freezed == image1Url
          ? _value.image1Url
          : image1Url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedInformationForChatModelImpl
    implements _FeedInformationForChatModel {
  const _$FeedInformationForChatModelImpl(
      {@JsonKey(name: 'listing_id') required this.listingId,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'listing_type') required this.listingType,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'image1_url') required this.image1Url});

  factory _$FeedInformationForChatModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FeedInformationForChatModelImplFromJson(json);

  @override
  @JsonKey(name: 'listing_id')
  final int listingId;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'listing_type')
  final String listingType;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'image1_url')
  final String? image1Url;

  @override
  String toString() {
    return 'FeedInformationForChatModel(listingId: $listingId, title: $title, listingType: $listingType, createdAt: $createdAt, image1Url: $image1Url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedInformationForChatModelImpl &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.image1Url, image1Url) ||
                other.image1Url == image1Url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, listingId, title, listingType, createdAt, image1Url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedInformationForChatModelImplCopyWith<_$FeedInformationForChatModelImpl>
      get copyWith => __$$FeedInformationForChatModelImplCopyWithImpl<
          _$FeedInformationForChatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedInformationForChatModelImplToJson(
      this,
    );
  }
}

abstract class _FeedInformationForChatModel
    implements FeedInformationForChatModel {
  const factory _FeedInformationForChatModel(
          {@JsonKey(name: 'listing_id') required final int listingId,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'listing_type') required final String listingType,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'image1_url') required final String? image1Url}) =
      _$FeedInformationForChatModelImpl;

  factory _FeedInformationForChatModel.fromJson(Map<String, dynamic> json) =
      _$FeedInformationForChatModelImpl.fromJson;

  @override
  @JsonKey(name: 'listing_id')
  int get listingId;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'listing_type')
  String get listingType;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'image1_url')
  String? get image1Url;
  @override
  @JsonKey(ignore: true)
  _$$FeedInformationForChatModelImplCopyWith<_$FeedInformationForChatModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
