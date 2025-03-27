// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileDto _$UserProfileDtoFromJson(Map<String, dynamic> json) =>
    UserProfileDto(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      phone: json['phone'] as String,
      birthday: json['birthday'] as String,
      gender: json['gender'] as String,
      hobbies: json['hobbies'] as String,
      occupation: json['occupation'] as String,
    );

Map<String, dynamic> _$UserProfileDtoToJson(UserProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'hobbies': instance.hobbies,
      'occupation': instance.occupation,
    };
