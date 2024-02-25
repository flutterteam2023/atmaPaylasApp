// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_block_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportBlockUserModel _$ReportBlockUserModelFromJson(Map<String, dynamic> json) {
  return _ReportBlockUserModel.fromJson(json);
}

/// @nodoc
mixin _$ReportBlockUserModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'surname')
  String get surname => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_located_district')
  String get userLocatedDistrict => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_located_city')
  String get userLocatedCity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportBlockUserModelCopyWith<ReportBlockUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportBlockUserModelCopyWith<$Res> {
  factory $ReportBlockUserModelCopyWith(ReportBlockUserModel value,
          $Res Function(ReportBlockUserModel) then) =
      _$ReportBlockUserModelCopyWithImpl<$Res, ReportBlockUserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'username') String username,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'surname') String surname,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'user_located_district') String userLocatedDistrict,
      @JsonKey(name: 'user_located_city') String userLocatedCity});
}

/// @nodoc
class _$ReportBlockUserModelCopyWithImpl<$Res,
        $Val extends ReportBlockUserModel>
    implements $ReportBlockUserModelCopyWith<$Res> {
  _$ReportBlockUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = null,
    Object? surname = null,
    Object? profileImage = freezed,
    Object? userLocatedDistrict = null,
    Object? userLocatedCity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      userLocatedDistrict: null == userLocatedDistrict
          ? _value.userLocatedDistrict
          : userLocatedDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      userLocatedCity: null == userLocatedCity
          ? _value.userLocatedCity
          : userLocatedCity // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportBlockUserModelImplCopyWith<$Res>
    implements $ReportBlockUserModelCopyWith<$Res> {
  factory _$$ReportBlockUserModelImplCopyWith(_$ReportBlockUserModelImpl value,
          $Res Function(_$ReportBlockUserModelImpl) then) =
      __$$ReportBlockUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'username') String username,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'surname') String surname,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'user_located_district') String userLocatedDistrict,
      @JsonKey(name: 'user_located_city') String userLocatedCity});
}

/// @nodoc
class __$$ReportBlockUserModelImplCopyWithImpl<$Res>
    extends _$ReportBlockUserModelCopyWithImpl<$Res, _$ReportBlockUserModelImpl>
    implements _$$ReportBlockUserModelImplCopyWith<$Res> {
  __$$ReportBlockUserModelImplCopyWithImpl(_$ReportBlockUserModelImpl _value,
      $Res Function(_$ReportBlockUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = null,
    Object? surname = null,
    Object? profileImage = freezed,
    Object? userLocatedDistrict = null,
    Object? userLocatedCity = null,
  }) {
    return _then(_$ReportBlockUserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      userLocatedDistrict: null == userLocatedDistrict
          ? _value.userLocatedDistrict
          : userLocatedDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      userLocatedCity: null == userLocatedCity
          ? _value.userLocatedCity
          : userLocatedCity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportBlockUserModelImpl implements _ReportBlockUserModel {
  const _$ReportBlockUserModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'username') required this.username,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'surname') required this.surname,
      @JsonKey(name: 'profile_image') required this.profileImage,
      @JsonKey(name: 'user_located_district') required this.userLocatedDistrict,
      @JsonKey(name: 'user_located_city') required this.userLocatedCity});

  factory _$ReportBlockUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportBlockUserModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'username')
  final String username;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'surname')
  final String surname;
  @override
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @override
  @JsonKey(name: 'user_located_district')
  final String userLocatedDistrict;
  @override
  @JsonKey(name: 'user_located_city')
  final String userLocatedCity;

  @override
  String toString() {
    return 'ReportBlockUserModel(id: $id, username: $username, name: $name, surname: $surname, profileImage: $profileImage, userLocatedDistrict: $userLocatedDistrict, userLocatedCity: $userLocatedCity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportBlockUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.userLocatedDistrict, userLocatedDistrict) ||
                other.userLocatedDistrict == userLocatedDistrict) &&
            (identical(other.userLocatedCity, userLocatedCity) ||
                other.userLocatedCity == userLocatedCity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, name, surname,
      profileImage, userLocatedDistrict, userLocatedCity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportBlockUserModelImplCopyWith<_$ReportBlockUserModelImpl>
      get copyWith =>
          __$$ReportBlockUserModelImplCopyWithImpl<_$ReportBlockUserModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportBlockUserModelImplToJson(
      this,
    );
  }
}

abstract class _ReportBlockUserModel implements ReportBlockUserModel {
  const factory _ReportBlockUserModel(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'username') required final String username,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'surname') required final String surname,
      @JsonKey(name: 'profile_image') required final String? profileImage,
      @JsonKey(name: 'user_located_district')
      required final String userLocatedDistrict,
      @JsonKey(name: 'user_located_city')
      required final String userLocatedCity}) = _$ReportBlockUserModelImpl;

  factory _ReportBlockUserModel.fromJson(Map<String, dynamic> json) =
      _$ReportBlockUserModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'username')
  String get username;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'surname')
  String get surname;
  @override
  @JsonKey(name: 'profile_image')
  String? get profileImage;
  @override
  @JsonKey(name: 'user_located_district')
  String get userLocatedDistrict;
  @override
  @JsonKey(name: 'user_located_city')
  String get userLocatedCity;
  @override
  @JsonKey(ignore: true)
  _$$ReportBlockUserModelImplCopyWith<_$ReportBlockUserModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
