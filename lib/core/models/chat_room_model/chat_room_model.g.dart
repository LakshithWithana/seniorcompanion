// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoomModel _$$_ChatRoomModelFromJson(Map<String, dynamic> json) =>
    _$_ChatRoomModel(
      chatRoomID: json['chatRoomID'] as String,
      myID: json['myID'],
      recipientID: json['recipientID'],
    );

Map<String, dynamic> _$$_ChatRoomModelToJson(_$_ChatRoomModel instance) =>
    <String, dynamic>{
      'chatRoomID': instance.chatRoomID,
      'myID': instance.myID,
      'recipientID': instance.recipientID,
    };
