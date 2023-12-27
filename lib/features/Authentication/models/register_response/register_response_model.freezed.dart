// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterResponseModel _$RegisterResponseModelFromJson(
    Map<String, dynamic> json) {
  return _RegisterResponseModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterResponseModel {
  @JsonKey(name: "success")
  String get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterResponseModelCopyWith<RegisterResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResponseModelCopyWith<$Res> {
  factory $RegisterResponseModelCopyWith(RegisterResponseModel value,
          $Res Function(RegisterResponseModel) then) =
      _$RegisterResponseModelCopyWithImpl<$Res, RegisterResponseModel>;
  @useResult
  $Res call({@JsonKey(name: "success") String success});
}

/// @nodoc
class _$RegisterResponseModelCopyWithImpl<$Res,
        $Val extends RegisterResponseModel>
    implements $RegisterResponseModelCopyWith<$Res> {
  _$RegisterResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterResponseModelImplCopyWith<$Res>
    implements $RegisterResponseModelCopyWith<$Res> {
  factory _$$RegisterResponseModelImplCopyWith(
          _$RegisterResponseModelImpl value,
          $Res Function(_$RegisterResponseModelImpl) then) =
      __$$RegisterResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "success") String success});
}

/// @nodoc
class __$$RegisterResponseModelImplCopyWithImpl<$Res>
    extends _$RegisterResponseModelCopyWithImpl<$Res,
        _$RegisterResponseModelImpl>
    implements _$$RegisterResponseModelImplCopyWith<$Res> {
  __$$RegisterResponseModelImplCopyWithImpl(_$RegisterResponseModelImpl _value,
      $Res Function(_$RegisterResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$RegisterResponseModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterResponseModelImpl implements _RegisterResponseModel {
  const _$RegisterResponseModelImpl(
      {@JsonKey(name: "success") required this.success});

  factory _$RegisterResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "success")
  final String success;

  @override
  String toString() {
    return 'RegisterResponseModel(success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterResponseModelImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterResponseModelImplCopyWith<_$RegisterResponseModelImpl>
      get copyWith => __$$RegisterResponseModelImplCopyWithImpl<
          _$RegisterResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterResponseModelImplToJson(
      this,
    );
  }
}

abstract class _RegisterResponseModel implements RegisterResponseModel {
  const factory _RegisterResponseModel(
          {@JsonKey(name: "success") required final String success}) =
      _$RegisterResponseModelImpl;

  factory _RegisterResponseModel.fromJson(Map<String, dynamic> json) =
      _$RegisterResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "success")
  String get success;
  @override
  @JsonKey(ignore: true)
  _$$RegisterResponseModelImplCopyWith<_$RegisterResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
