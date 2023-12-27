// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: "user_id")
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "surname")
  String get surname => throw _privateConstructorUsedError;
  @JsonKey(name: "user_located_city")
  String get userLocatedCity => throw _privateConstructorUsedError;
  @JsonKey(name: "user_located_district")
  String get userLocatedDistrict => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int userId,
      @JsonKey(name: "username") String username,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "phone_number") String phoneNumber,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "surname") String surname,
      @JsonKey(name: "user_located_city") String userLocatedCity,
      @JsonKey(name: "user_located_district") String userLocatedDistrict,
      @JsonKey(name: "image") String? image});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? name = null,
    Object? surname = null,
    Object? userLocatedCity = null,
    Object? userLocatedDistrict = null,
    Object? image = freezed,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      userLocatedCity: null == userLocatedCity
          ? _value.userLocatedCity
          : userLocatedCity // ignore: cast_nullable_to_non_nullable
              as String,
      userLocatedDistrict: null == userLocatedDistrict
          ? _value.userLocatedDistrict
          : userLocatedDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int userId,
      @JsonKey(name: "username") String username,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "phone_number") String phoneNumber,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "surname") String surname,
      @JsonKey(name: "user_located_city") String userLocatedCity,
      @JsonKey(name: "user_located_district") String userLocatedDistrict,
      @JsonKey(name: "image") String? image});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? name = null,
    Object? surname = null,
    Object? userLocatedCity = null,
    Object? userLocatedDistrict = null,
    Object? image = freezed,
  }) {
    return _then(_$UserModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      userLocatedCity: null == userLocatedCity
          ? _value.userLocatedCity
          : userLocatedCity // ignore: cast_nullable_to_non_nullable
              as String,
      userLocatedDistrict: null == userLocatedDistrict
          ? _value.userLocatedDistrict
          : userLocatedDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(name: "user_id") required this.userId,
      @JsonKey(name: "username") required this.username,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "phone_number") required this.phoneNumber,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "surname") required this.surname,
      @JsonKey(name: "user_located_city") required this.userLocatedCity,
      @JsonKey(name: "user_located_district") required this.userLocatedDistrict,
      @JsonKey(name: "image") required this.image});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: "user_id")
  final int userId;
  @override
  @JsonKey(name: "username")
  final String username;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "surname")
  final String surname;
  @override
  @JsonKey(name: "user_located_city")
  final String userLocatedCity;
  @override
  @JsonKey(name: "user_located_district")
  final String userLocatedDistrict;
  @override
  @JsonKey(name: "image")
  final String? image;

  @override
  String toString() {
    return 'UserModel(userId: $userId, username: $username, email: $email, phoneNumber: $phoneNumber, name: $name, surname: $surname, userLocatedCity: $userLocatedCity, userLocatedDistrict: $userLocatedDistrict, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.userLocatedCity, userLocatedCity) ||
                other.userLocatedCity == userLocatedCity) &&
            (identical(other.userLocatedDistrict, userLocatedDistrict) ||
                other.userLocatedDistrict == userLocatedDistrict) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, username, email,
      phoneNumber, name, surname, userLocatedCity, userLocatedDistrict, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: "user_id") required final int userId,
      @JsonKey(name: "username") required final String username,
      @JsonKey(name: "email") required final String email,
      @JsonKey(name: "phone_number") required final String phoneNumber,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "surname") required final String surname,
      @JsonKey(name: "user_located_city") required final String userLocatedCity,
      @JsonKey(name: "user_located_district")
      required final String userLocatedDistrict,
      @JsonKey(name: "image") required final String? image}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: "user_id")
  int get userId;
  @override
  @JsonKey(name: "username")
  String get username;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "phone_number")
  String get phoneNumber;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "surname")
  String get surname;
  @override
  @JsonKey(name: "user_located_city")
  String get userLocatedCity;
  @override
  @JsonKey(name: "user_located_district")
  String get userLocatedDistrict;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
