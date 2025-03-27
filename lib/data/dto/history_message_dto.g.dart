// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryMessageDto _$HistoryMessageDtoFromJson(Map<String, dynamic> json) =>
    HistoryMessageDto(
      user_id: json['user_id'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageUserAndAiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryMessageDtoToJson(HistoryMessageDto instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'messages': instance.messages,
    };
