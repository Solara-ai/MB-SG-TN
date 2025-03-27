// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_message_user_ai_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMessageUserAiDto _$ListMessageUserAiDtoFromJson(
        Map<String, dynamic> json) =>
    ListMessageUserAiDto(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageUserAndAiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListMessageUserAiDtoToJson(
        ListMessageUserAiDto instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };
