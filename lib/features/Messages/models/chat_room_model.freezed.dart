// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) {
  return _ChatRoomModel.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomModel {
  @JsonKey(name: 'room_id')
  int get roomId => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest_message')
  LatestMessage? get latestMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'other_user')
  OtherUser get otherUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'listing')
  Listing? get listing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomModelCopyWith<ChatRoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomModelCopyWith<$Res> {
  factory $ChatRoomModelCopyWith(
          ChatRoomModel value, $Res Function(ChatRoomModel) then) =
      _$ChatRoomModelCopyWithImpl<$Res, ChatRoomModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'room_id') int roomId,
      @JsonKey(name: 'latest_message') LatestMessage? latestMessage,
      @JsonKey(name: 'other_user') OtherUser otherUser,
      @JsonKey(name: 'listing') Listing? listing});

  $LatestMessageCopyWith<$Res>? get latestMessage;
  $OtherUserCopyWith<$Res> get otherUser;
  $ListingCopyWith<$Res>? get listing;
}

/// @nodoc
class _$ChatRoomModelCopyWithImpl<$Res, $Val extends ChatRoomModel>
    implements $ChatRoomModelCopyWith<$Res> {
  _$ChatRoomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? latestMessage = freezed,
    Object? otherUser = null,
    Object? listing = freezed,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      latestMessage: freezed == latestMessage
          ? _value.latestMessage
          : latestMessage // ignore: cast_nullable_to_non_nullable
              as LatestMessage?,
      otherUser: null == otherUser
          ? _value.otherUser
          : otherUser // ignore: cast_nullable_to_non_nullable
              as OtherUser,
      listing: freezed == listing
          ? _value.listing
          : listing // ignore: cast_nullable_to_non_nullable
              as Listing?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LatestMessageCopyWith<$Res>? get latestMessage {
    if (_value.latestMessage == null) {
      return null;
    }

    return $LatestMessageCopyWith<$Res>(_value.latestMessage!, (value) {
      return _then(_value.copyWith(latestMessage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OtherUserCopyWith<$Res> get otherUser {
    return $OtherUserCopyWith<$Res>(_value.otherUser, (value) {
      return _then(_value.copyWith(otherUser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ListingCopyWith<$Res>? get listing {
    if (_value.listing == null) {
      return null;
    }

    return $ListingCopyWith<$Res>(_value.listing!, (value) {
      return _then(_value.copyWith(listing: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatRoomModelImplCopyWith<$Res>
    implements $ChatRoomModelCopyWith<$Res> {
  factory _$$ChatRoomModelImplCopyWith(
          _$ChatRoomModelImpl value, $Res Function(_$ChatRoomModelImpl) then) =
      __$$ChatRoomModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'room_id') int roomId,
      @JsonKey(name: 'latest_message') LatestMessage? latestMessage,
      @JsonKey(name: 'other_user') OtherUser otherUser,
      @JsonKey(name: 'listing') Listing? listing});

  @override
  $LatestMessageCopyWith<$Res>? get latestMessage;
  @override
  $OtherUserCopyWith<$Res> get otherUser;
  @override
  $ListingCopyWith<$Res>? get listing;
}

/// @nodoc
class __$$ChatRoomModelImplCopyWithImpl<$Res>
    extends _$ChatRoomModelCopyWithImpl<$Res, _$ChatRoomModelImpl>
    implements _$$ChatRoomModelImplCopyWith<$Res> {
  __$$ChatRoomModelImplCopyWithImpl(
      _$ChatRoomModelImpl _value, $Res Function(_$ChatRoomModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? latestMessage = freezed,
    Object? otherUser = null,
    Object? listing = freezed,
  }) {
    return _then(_$ChatRoomModelImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      latestMessage: freezed == latestMessage
          ? _value.latestMessage
          : latestMessage // ignore: cast_nullable_to_non_nullable
              as LatestMessage?,
      otherUser: null == otherUser
          ? _value.otherUser
          : otherUser // ignore: cast_nullable_to_non_nullable
              as OtherUser,
      listing: freezed == listing
          ? _value.listing
          : listing // ignore: cast_nullable_to_non_nullable
              as Listing?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomModelImpl implements _ChatRoomModel {
  const _$ChatRoomModelImpl(
      {@JsonKey(name: 'room_id') required this.roomId,
      @JsonKey(name: 'latest_message') required this.latestMessage,
      @JsonKey(name: 'other_user') required this.otherUser,
      @JsonKey(name: 'listing') required this.listing});

  factory _$ChatRoomModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomModelImplFromJson(json);

  @override
  @JsonKey(name: 'room_id')
  final int roomId;
  @override
  @JsonKey(name: 'latest_message')
  final LatestMessage? latestMessage;
  @override
  @JsonKey(name: 'other_user')
  final OtherUser otherUser;
  @override
  @JsonKey(name: 'listing')
  final Listing? listing;

  @override
  String toString() {
    return 'ChatRoomModel(roomId: $roomId, latestMessage: $latestMessage, otherUser: $otherUser, listing: $listing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomModelImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.latestMessage, latestMessage) ||
                other.latestMessage == latestMessage) &&
            (identical(other.otherUser, otherUser) ||
                other.otherUser == otherUser) &&
            (identical(other.listing, listing) || other.listing == listing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, roomId, latestMessage, otherUser, listing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomModelImplCopyWith<_$ChatRoomModelImpl> get copyWith =>
      __$$ChatRoomModelImplCopyWithImpl<_$ChatRoomModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomModelImplToJson(
      this,
    );
  }
}

abstract class _ChatRoomModel implements ChatRoomModel {
  const factory _ChatRoomModel(
          {@JsonKey(name: 'room_id') required final int roomId,
          @JsonKey(name: 'latest_message')
          required final LatestMessage? latestMessage,
          @JsonKey(name: 'other_user') required final OtherUser otherUser,
          @JsonKey(name: 'listing') required final Listing? listing}) =
      _$ChatRoomModelImpl;

  factory _ChatRoomModel.fromJson(Map<String, dynamic> json) =
      _$ChatRoomModelImpl.fromJson;

  @override
  @JsonKey(name: 'room_id')
  int get roomId;
  @override
  @JsonKey(name: 'latest_message')
  LatestMessage? get latestMessage;
  @override
  @JsonKey(name: 'other_user')
  OtherUser get otherUser;
  @override
  @JsonKey(name: 'listing')
  Listing? get listing;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomModelImplCopyWith<_$ChatRoomModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LatestMessage _$LatestMessageFromJson(Map<String, dynamic> json) {
  return _LatestMessage.fromJson(json);
}

/// @nodoc
mixin _$LatestMessage {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'author')
  String get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp')
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatestMessageCopyWith<LatestMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestMessageCopyWith<$Res> {
  factory $LatestMessageCopyWith(
          LatestMessage value, $Res Function(LatestMessage) then) =
      _$LatestMessageCopyWithImpl<$Res, LatestMessage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'author') String author,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'timestamp') DateTime timestamp});
}

/// @nodoc
class _$LatestMessageCopyWithImpl<$Res, $Val extends LatestMessage>
    implements $LatestMessageCopyWith<$Res> {
  _$LatestMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? content = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LatestMessageImplCopyWith<$Res>
    implements $LatestMessageCopyWith<$Res> {
  factory _$$LatestMessageImplCopyWith(
          _$LatestMessageImpl value, $Res Function(_$LatestMessageImpl) then) =
      __$$LatestMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'author') String author,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'timestamp') DateTime timestamp});
}

/// @nodoc
class __$$LatestMessageImplCopyWithImpl<$Res>
    extends _$LatestMessageCopyWithImpl<$Res, _$LatestMessageImpl>
    implements _$$LatestMessageImplCopyWith<$Res> {
  __$$LatestMessageImplCopyWithImpl(
      _$LatestMessageImpl _value, $Res Function(_$LatestMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? content = null,
    Object? timestamp = null,
  }) {
    return _then(_$LatestMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LatestMessageImpl implements _LatestMessage {
  const _$LatestMessageImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'author') required this.author,
      @JsonKey(name: 'content') required this.content,
      @JsonKey(name: 'timestamp') required this.timestamp});

  factory _$LatestMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatestMessageImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'author')
  final String author;
  @override
  @JsonKey(name: 'content')
  final String content;
  @override
  @JsonKey(name: 'timestamp')
  final DateTime timestamp;

  @override
  String toString() {
    return 'LatestMessage(id: $id, author: $author, content: $content, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatestMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, author, content, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LatestMessageImplCopyWith<_$LatestMessageImpl> get copyWith =>
      __$$LatestMessageImplCopyWithImpl<_$LatestMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LatestMessageImplToJson(
      this,
    );
  }
}

abstract class _LatestMessage implements LatestMessage {
  const factory _LatestMessage(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'author') required final String author,
          @JsonKey(name: 'content') required final String content,
          @JsonKey(name: 'timestamp') required final DateTime timestamp}) =
      _$LatestMessageImpl;

  factory _LatestMessage.fromJson(Map<String, dynamic> json) =
      _$LatestMessageImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'author')
  String get author;
  @override
  @JsonKey(name: 'content')
  String get content;
  @override
  @JsonKey(name: 'timestamp')
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$LatestMessageImplCopyWith<_$LatestMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Listing _$ListingFromJson(Map<String, dynamic> json) {
  return _Listing.fromJson(json);
}

/// @nodoc
mixin _$Listing {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'listing_type')
  String get listingType => throw _privateConstructorUsedError;
  @JsonKey(name: 'image1_url')
  String? get image1Url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListingCopyWith<Listing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingCopyWith<$Res> {
  factory $ListingCopyWith(Listing value, $Res Function(Listing) then) =
      _$ListingCopyWithImpl<$Res, Listing>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'listing_type') String listingType,
      @JsonKey(name: 'image1_url') String? image1Url});
}

/// @nodoc
class _$ListingCopyWithImpl<$Res, $Val extends Listing>
    implements $ListingCopyWith<$Res> {
  _$ListingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? listingType = null,
    Object? image1Url = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String,
      image1Url: freezed == image1Url
          ? _value.image1Url
          : image1Url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListingImplCopyWith<$Res> implements $ListingCopyWith<$Res> {
  factory _$$ListingImplCopyWith(
          _$ListingImpl value, $Res Function(_$ListingImpl) then) =
      __$$ListingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'listing_type') String listingType,
      @JsonKey(name: 'image1_url') String? image1Url});
}

/// @nodoc
class __$$ListingImplCopyWithImpl<$Res>
    extends _$ListingCopyWithImpl<$Res, _$ListingImpl>
    implements _$$ListingImplCopyWith<$Res> {
  __$$ListingImplCopyWithImpl(
      _$ListingImpl _value, $Res Function(_$ListingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? listingType = null,
    Object? image1Url = freezed,
  }) {
    return _then(_$ListingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String,
      image1Url: freezed == image1Url
          ? _value.image1Url
          : image1Url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListingImpl implements _Listing {
  const _$ListingImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'listing_type') required this.listingType,
      @JsonKey(name: 'image1_url') required this.image1Url});

  factory _$ListingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListingImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'listing_type')
  final String listingType;
  @override
  @JsonKey(name: 'image1_url')
  final String? image1Url;

  @override
  String toString() {
    return 'Listing(id: $id, title: $title, listingType: $listingType, image1Url: $image1Url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            (identical(other.image1Url, image1Url) ||
                other.image1Url == image1Url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, listingType, image1Url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingImplCopyWith<_$ListingImpl> get copyWith =>
      __$$ListingImplCopyWithImpl<_$ListingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListingImplToJson(
      this,
    );
  }
}

abstract class _Listing implements Listing {
  const factory _Listing(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'listing_type') required final String listingType,
          @JsonKey(name: 'image1_url') required final String? image1Url}) =
      _$ListingImpl;

  factory _Listing.fromJson(Map<String, dynamic> json) = _$ListingImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'listing_type')
  String get listingType;
  @override
  @JsonKey(name: 'image1_url')
  String? get image1Url;
  @override
  @JsonKey(ignore: true)
  _$$ListingImplCopyWith<_$ListingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OtherUser _$OtherUserFromJson(Map<String, dynamic> json) {
  return _OtherUser.fromJson(json);
}

/// @nodoc
mixin _$OtherUser {
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtherUserCopyWith<OtherUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherUserCopyWith<$Res> {
  factory $OtherUserCopyWith(OtherUser value, $Res Function(OtherUser) then) =
      _$OtherUserCopyWithImpl<$Res, OtherUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'username') String username,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'surname') String surname,
      @JsonKey(name: 'profile_image') String? profileImage});
}

/// @nodoc
class _$OtherUserCopyWithImpl<$Res, $Val extends OtherUser>
    implements $OtherUserCopyWith<$Res> {
  _$OtherUserCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtherUserImplCopyWith<$Res>
    implements $OtherUserCopyWith<$Res> {
  factory _$$OtherUserImplCopyWith(
          _$OtherUserImpl value, $Res Function(_$OtherUserImpl) then) =
      __$$OtherUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'username') String username,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'surname') String surname,
      @JsonKey(name: 'profile_image') String? profileImage});
}

/// @nodoc
class __$$OtherUserImplCopyWithImpl<$Res>
    extends _$OtherUserCopyWithImpl<$Res, _$OtherUserImpl>
    implements _$$OtherUserImplCopyWith<$Res> {
  __$$OtherUserImplCopyWithImpl(
      _$OtherUserImpl _value, $Res Function(_$OtherUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = null,
    Object? surname = null,
    Object? profileImage = freezed,
  }) {
    return _then(_$OtherUserImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtherUserImpl implements _OtherUser {
  const _$OtherUserImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'username') required this.username,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'surname') required this.surname,
      @JsonKey(name: 'profile_image') required this.profileImage});

  factory _$OtherUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtherUserImplFromJson(json);

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
  String toString() {
    return 'OtherUser(id: $id, username: $username, name: $name, surname: $surname, profileImage: $profileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, name, surname, profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherUserImplCopyWith<_$OtherUserImpl> get copyWith =>
      __$$OtherUserImplCopyWithImpl<_$OtherUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtherUserImplToJson(
      this,
    );
  }
}

abstract class _OtherUser implements OtherUser {
  const factory _OtherUser(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'username') required final String username,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'surname') required final String surname,
      @JsonKey(name: 'profile_image')
      required final String? profileImage}) = _$OtherUserImpl;

  factory _OtherUser.fromJson(Map<String, dynamic> json) =
      _$OtherUserImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$OtherUserImplCopyWith<_$OtherUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
