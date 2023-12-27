// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccessModel _$AccessModelFromJson(Map<String, dynamic> json) {
  return _AccessModel.fromJson(json);
}

/// @nodoc
mixin _$AccessModel {
  @JsonKey(name: "access")
  String get access => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessModelCopyWith<AccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessModelCopyWith<$Res> {
  factory $AccessModelCopyWith(
          AccessModel value, $Res Function(AccessModel) then) =
      _$AccessModelCopyWithImpl<$Res, AccessModel>;
  @useResult
  $Res call({@JsonKey(name: "access") String access});
}

/// @nodoc
class _$AccessModelCopyWithImpl<$Res, $Val extends AccessModel>
    implements $AccessModelCopyWith<$Res> {
  _$AccessModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
  }) {
    return _then(_value.copyWith(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessModelImplCopyWith<$Res>
    implements $AccessModelCopyWith<$Res> {
  factory _$$AccessModelImplCopyWith(
          _$AccessModelImpl value, $Res Function(_$AccessModelImpl) then) =
      __$$AccessModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "access") String access});
}

/// @nodoc
class __$$AccessModelImplCopyWithImpl<$Res>
    extends _$AccessModelCopyWithImpl<$Res, _$AccessModelImpl>
    implements _$$AccessModelImplCopyWith<$Res> {
  __$$AccessModelImplCopyWithImpl(
      _$AccessModelImpl _value, $Res Function(_$AccessModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
  }) {
    return _then(_$AccessModelImpl(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessModelImpl implements _AccessModel {
  const _$AccessModelImpl({@JsonKey(name: "access") required this.access});

  factory _$AccessModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessModelImplFromJson(json);

  @override
  @JsonKey(name: "access")
  final String access;

  @override
  String toString() {
    return 'AccessModel(access: $access)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessModelImpl &&
            (identical(other.access, access) || other.access == access));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, access);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessModelImplCopyWith<_$AccessModelImpl> get copyWith =>
      __$$AccessModelImplCopyWithImpl<_$AccessModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessModelImplToJson(
      this,
    );
  }
}

abstract class _AccessModel implements AccessModel {
  const factory _AccessModel(
          {@JsonKey(name: "access") required final String access}) =
      _$AccessModelImpl;

  factory _AccessModel.fromJson(Map<String, dynamic> json) =
      _$AccessModelImpl.fromJson;

  @override
  @JsonKey(name: "access")
  String get access;
  @override
  @JsonKey(ignore: true)
  _$$AccessModelImplCopyWith<_$AccessModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
