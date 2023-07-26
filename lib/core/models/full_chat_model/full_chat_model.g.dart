// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FullChatModel _$$_FullChatModelFromJson(Map<String, dynamic> json) =>
    _$_FullChatModel(
      myUid: (json['myUid'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      partnerUid: (json['partnerUid'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      chatID: json['chatID'] as String,
    );

Map<String, dynamic> _$$_FullChatModelToJson(_$_FullChatModel instance) =>
    <String, dynamic>{
      'myUid': instance.myUid,
      'partnerUid': instance.partnerUid,
      'chatID': instance.chatID,
    };
