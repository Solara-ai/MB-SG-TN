// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserRequest _$RegisterUserRequestFromJson(Map<String, dynamic> json) =>
    RegisterUserRequest(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      hobbies: json['hobbies'] as String,
      occupation: json['occupation'] as String,
      birthday: json['birthday'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterUserRequestToJson(
        RegisterUserRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'hobbies': instance.hobbies,
      'occupation': instance.occupation,
      'birthday': instance.birthday,
      'password': instance.password,
    };
