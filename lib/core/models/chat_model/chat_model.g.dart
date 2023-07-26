// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatModel _$$_ChatModelFromJson(Map<String, dynamic> json) => _$_ChatModel(
      message: json['message'] as String,
      sentBy: json['sentBy'] as String,
      timestamp: json['timestamp'] as int,
    );

Map<String, dynamic> _$$_ChatModelToJson(_$_ChatModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sentBy': instance.sentBy,
      'timestamp': instance.timestamp,
    };
