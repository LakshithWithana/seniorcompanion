// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDetails _$$_UserDetailsFromJson(Map<String, dynamic> json) =>
    _$_UserDetails(
      uid: json['uid'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      role: json['role'] as String,
      birthday: json['birthday'] as String,
      about: json['about'] as String,
      gender: json['gender'] as String,
      preferences: (json['preferences'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      profilePicURL: json['profilePicURL'] as String,
    );

Map<String, dynamic> _$$_UserDetailsToJson(_$_UserDetails instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'role': instance.role,
      'birthday': instance.birthday,
      'about': instance.about,
      'gender': instance.gender,
      'preferences': instance.preferences,
      'profilePicURL': instance.profilePicURL,
    };