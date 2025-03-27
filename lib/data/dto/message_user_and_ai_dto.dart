import 'package:json_annotation/json_annotation.dart';

part 'message_user_and_ai_dto.g.dart';
@JsonSerializable()
class MessageUserAndAiDto {
  final String text;
  final String reply;
  MessageUserAndAiDto({required this.text , required this.reply});

  factory MessageUserAndAiDto.fromJson (Map<String , dynamic> json) =>_$MessageUserAndAiDtoFromJson (json);

  Map<String , dynamic> toJson () => _$MessageUserAndAiDtoToJson(this);
}