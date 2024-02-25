// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MainCategoryModel _$MainCategoryModelFromJson(Map<String, dynamic> json) {
  return _MainCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$MainCategoryModel {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "has_subcategories")
  bool get hasSubcategories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainCategoryModelCopyWith<MainCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainCategoryModelCopyWith<$Res> {
  factory $MainCategoryModelCopyWith(
          MainCategoryModel value, $Res Function(MainCategoryModel) then) =
      _$MainCategoryModelCopyWithImpl<$Res, MainCategoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "has_subcategories") bool hasSubcategories});
}

/// @nodoc
class _$MainCategoryModelCopyWithImpl<$Res, $Val extends MainCategoryModel>
    implements $MainCategoryModelCopyWith<$Res> {
  _$MainCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hasSubcategories = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hasSubcategories: null == hasSubcategories
          ? _value.hasSubcategories
          : hasSubcategories // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainCategoryModelImplCopyWith<$Res>
    implements $MainCategoryModelCopyWith<$Res> {
  factory _$$MainCategoryModelImplCopyWith(_$MainCategoryModelImpl value,
          $Res Function(_$MainCategoryModelImpl) then) =
      __$$MainCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "has_subcategories") bool hasSubcategories});
}

/// @nodoc
class __$$MainCategoryModelImplCopyWithImpl<$Res>
    extends _$MainCategoryModelCopyWithImpl<$Res, _$MainCategoryModelImpl>
    implements _$$MainCategoryModelImplCopyWith<$Res> {
  __$$MainCategoryModelImplCopyWithImpl(_$MainCategoryModelImpl _value,
      $Res Function(_$MainCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hasSubcategories = null,
  }) {
    return _then(_$MainCategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hasSubcategories: null == hasSubcategories
          ? _value.hasSubcategories
          : hasSubcategories // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainCategoryModelImpl implements _MainCategoryModel {
  const _$MainCategoryModelImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "has_subcategories") required this.hasSubcategories});

  factory _$MainCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainCategoryModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "has_subcategories")
  final bool hasSubcategories;

  @override
  String toString() {
    return 'MainCategoryModel(id: $id, name: $name, hasSubcategories: $hasSubcategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hasSubcategories, hasSubcategories) ||
                other.hasSubcategories == hasSubcategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, hasSubcategories);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainCategoryModelImplCopyWith<_$MainCategoryModelImpl> get copyWith =>
      __$$MainCategoryModelImplCopyWithImpl<_$MainCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _MainCategoryModel implements MainCategoryModel {
  const factory _MainCategoryModel(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "has_subcategories")
      required final bool hasSubcategories}) = _$MainCategoryModelImpl;

  factory _MainCategoryModel.fromJson(Map<String, dynamic> json) =
      _$MainCategoryModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "has_subcategories")
  bool get hasSubcategories;
  @override
  @JsonKey(ignore: true)
  _$$MainCategoryModelImplCopyWith<_$MainCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
