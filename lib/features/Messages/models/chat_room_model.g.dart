// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoomModelImpl _$$ChatRoomModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatRoomModelImpl(
      roomId: json['room_id'] as int,
      latestMessage: json['latest_message'] == null
          ? null
          : LatestMessage.fromJson(
              json['latest_message'] as Map<String, dynamic>),
      otherUser: OtherUser.fromJson(json['other_user'] as Map<String, dynamic>),
      listing: json['listing'] == null
          ? null
          : Listing.fromJson(json['listing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatRoomModelImplToJson(_$ChatRoomModelImpl instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
      'latest_message': instance.latestMessage,
      'other_user': instance.otherUser,
      'listing': instance.listing,
    };

_$LatestMessageImpl _$$LatestMessageImplFromJson(Map<String, dynamic> json) =>
    _$LatestMessageImpl(
      id: json['id'] as int,
      author: json['author'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$LatestMessageImplToJson(_$LatestMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_$ListingImpl _$$ListingImplFromJson(Map<String, dynamic> json) =>
    _$ListingImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      listingType: json['listing_type'] as String,
      image1Url: json['image1_url'] as String?,
    );

Map<String, dynamic> _$$ListingImplToJson(_$ListingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'listing_type': instance.listingType,
      'image1_url': instance.image1Url,
    };

_$OtherUserImpl _$$OtherUserImplFromJson(Map<String, dynamic> json) =>
    _$OtherUserImpl(
      id: json['id'] as int,
      username: json['username'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$$OtherUserImplToJson(_$OtherUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'surname': instance.surname,
      'profile_image': instance.profileImage,
    };
