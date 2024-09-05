// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemUser _$SystemUserFromJson(Map<String, dynamic> json) => SystemUser(
      username: json['username'] as String?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      moodlePhoto: json['moodlePhoto'] as String?,
      customPhoto: json['customPhoto'] as String?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SystemUserToJson(SystemUser instance) =>
    <String, dynamic>{
      'username': instance.username,
      'fullname': instance.fullname,
      'email': instance.email,
      'city': instance.city,
      'country': instance.country,
      'moodlePhoto': instance.moodlePhoto,
      'customPhoto': instance.customPhoto,
      'active': instance.active,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
