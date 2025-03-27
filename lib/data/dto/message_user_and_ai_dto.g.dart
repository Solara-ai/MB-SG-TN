// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_user_and_ai_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageUserAndAiDto _$MessageUserAndAiDtoFromJson(Map<String, dynamic> json) =>
    MessageUserAndAiDto(
      text: json['text'] as String,
      reply: json['reply'] as String,
    );

Map<String, dynamic> _$MessageUserAndAiDtoToJson(
        MessageUserAndAiDto instance) =>
    <String, dynamic>{
      'text': instance.text,
      'reply': instance.reply,
    };
