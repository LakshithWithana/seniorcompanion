// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claims_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClaimsModel _$$_ClaimsModelFromJson(Map<String, dynamic> json) =>
    _$_ClaimsModel(
      userId: json['user_id'] as String,
      role: json['role'] as String?,
      email: json['email'] as String?,
      profileUpdated: json['profileUpdated'] as bool?,
      lastCommitted:
          const DateStampConverterForNull().fromJson(json['_lastCommitted']),
    );

Map<String, dynamic> _$$_ClaimsModelToJson(_$_ClaimsModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'role': instance.role,
      'email': instance.email,
      'profileUpdated': instance.profileUpdated,
      '_lastCommitted':
          const DateStampConverterForNull().toJson(instance.lastCommitted),
    };
