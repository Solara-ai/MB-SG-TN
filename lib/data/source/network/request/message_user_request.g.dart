// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageUserRequest _$MessageUserRequestFromJson(Map<String, dynamic> json) =>
    MessageUserRequest(
      user_id: json['user_id'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$MessageUserRequestToJson(MessageUserRequest instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'text': instance.text,
    };
