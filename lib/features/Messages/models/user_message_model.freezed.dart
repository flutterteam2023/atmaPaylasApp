// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserMessage _$UserMessageFromJson(Map<String, dynamic> json) {
  return _UserMessage.fromJson(json);
}

/// @nodoc
mixin _$UserMessage {
  @JsonKey(name: "username")
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  Content get content => throw _privateConstructorUsedError;
  @JsonKey(name: "timestamp")
  String get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: "other_username")
  String? get otherUsername => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserMessageCopyWith<UserMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserMessageCopyWith<$Res> {
  factory $UserMessageCopyWith(
          UserMessage value, $Res Function(UserMessage) then) =
      _$UserMessageCopyWithImpl<$Res, UserMessage>;
  @useResult
  $Res call(
      {@JsonKey(name: "username") String username,
      @JsonKey(name: "content") Content content,
      @JsonKey(name: "timestamp") String timestamp,
      @JsonKey(name: "other_username") String? otherUsername});

  $ContentCopyWith<$Res> get content;
}

/// @nodoc
class _$UserMessageCopyWithImpl<$Res, $Val extends UserMessage>
    implements $UserMessageCopyWith<$Res> {
  _$UserMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? content = null,
    Object? timestamp = null,
    Object? otherUsername = freezed,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      otherUsername: freezed == otherUsername
          ? _value.otherUsername
          : otherUsername // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentCopyWith<$Res> get content {
    return $ContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserMessageImplCopyWith<$Res>
    implements $UserMessageCopyWith<$Res> {
  factory _$$UserMessageImplCopyWith(
          _$UserMessageImpl value, $Res Function(_$UserMessageImpl) then) =
      __$$UserMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "username") String username,
      @JsonKey(name: "content") Content content,
      @JsonKey(name: "timestamp") String timestamp,
      @JsonKey(name: "other_username") String? otherUsername});

  @override
  $ContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$UserMessageImplCopyWithImpl<$Res>
    extends _$UserMessageCopyWithImpl<$Res, _$UserMessageImpl>
    implements _$$UserMessageImplCopyWith<$Res> {
  __$$UserMessageImplCopyWithImpl(
      _$UserMessageImpl _value, $Res Function(_$UserMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? content = null,
    Object? timestamp = null,
    Object? otherUsername = freezed,
  }) {
    return _then(_$UserMessageImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      otherUsername: freezed == otherUsername
          ? _value.otherUsername
          : otherUsername // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserMessageImpl implements _UserMessage {
  const _$UserMessageImpl(
      {@JsonKey(name: "username") required this.username,
      @JsonKey(name: "content") required this.content,
      @JsonKey(name: "timestamp") required this.timestamp,
      @JsonKey(name: "other_username") required this.otherUsername});

  factory _$UserMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserMessageImplFromJson(json);

  @override
  @JsonKey(name: "username")
  final String username;
  @override
  @JsonKey(name: "content")
  final Content content;
  @override
  @JsonKey(name: "timestamp")
  final String timestamp;
  @override
  @JsonKey(name: "other_username")
  final String? otherUsername;

  @override
  String toString() {
    return 'UserMessage(username: $username, content: $content, timestamp: $timestamp, otherUsername: $otherUsername)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserMessageImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.otherUsername, otherUsername) ||
                other.otherUsername == otherUsername));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, content, timestamp, otherUsername);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserMessageImplCopyWith<_$UserMessageImpl> get copyWith =>
      __$$UserMessageImplCopyWithImpl<_$UserMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserMessageImplToJson(
      this,
    );
  }
}

abstract class _UserMessage implements UserMessage {
  const factory _UserMessage(
      {@JsonKey(name: "username") required final String username,
      @JsonKey(name: "content") required final Content content,
      @JsonKey(name: "timestamp") required final String timestamp,
      @JsonKey(name: "other_username")
      required final String? otherUsername}) = _$UserMessageImpl;

  factory _UserMessage.fromJson(Map<String, dynamic> json) =
      _$UserMessageImpl.fromJson;

  @override
  @JsonKey(name: "username")
  String get username;
  @override
  @JsonKey(name: "content")
  Content get content;
  @override
  @JsonKey(name: "timestamp")
  String get timestamp;
  @override
  @JsonKey(name: "other_username")
  String? get otherUsername;
  @override
  @JsonKey(ignore: true)
  _$$UserMessageImplCopyWith<_$UserMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
mixin _$Content {
  @JsonKey(name: "type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "text")
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res, Content>;
  @useResult
  $Res call(
      {@JsonKey(name: "type") String type, @JsonKey(name: "text") String text});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res, $Val extends Content>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentImplCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$$ContentImplCopyWith(
          _$ContentImpl value, $Res Function(_$ContentImpl) then) =
      __$$ContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "type") String type, @JsonKey(name: "text") String text});
}

/// @nodoc
class __$$ContentImplCopyWithImpl<$Res>
    extends _$ContentCopyWithImpl<$Res, _$ContentImpl>
    implements _$$ContentImplCopyWith<$Res> {
  __$$ContentImplCopyWithImpl(
      _$ContentImpl _value, $Res Function(_$ContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
  }) {
    return _then(_$ContentImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentImpl implements _Content {
  const _$ContentImpl(
      {@JsonKey(name: "type") required this.type,
      @JsonKey(name: "text") required this.text});

  factory _$ContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentImplFromJson(json);

  @override
  @JsonKey(name: "type")
  final String type;
  @override
  @JsonKey(name: "text")
  final String text;

  @override
  String toString() {
    return 'Content(type: $type, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      __$$ContentImplCopyWithImpl<_$ContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentImplToJson(
      this,
    );
  }
}

abstract class _Content implements Content {
  const factory _Content(
      {@JsonKey(name: "type") required final String type,
      @JsonKey(name: "text") required final String text}) = _$ContentImpl;

  factory _Content.fromJson(Map<String, dynamic> json) = _$ContentImpl.fromJson;

  @override
  @JsonKey(name: "type")
  String get type;
  @override
  @JsonKey(name: "text")
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
