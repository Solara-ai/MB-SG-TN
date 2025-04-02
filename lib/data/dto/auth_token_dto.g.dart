// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenDto _$AuthTokenDtoFromJson(Map<String, dynamic> json) => AuthTokenDto(
      rememberMe: json['rememberMe'] as bool,
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$AuthTokenDtoToJson(AuthTokenDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'userId': instance.userId,
      'rememberMe': instance.rememberMe,
    };
