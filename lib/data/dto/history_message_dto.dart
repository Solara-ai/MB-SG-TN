
import 'package:json_annotation/json_annotation.dart';
import 'package:schedule_gen_and_time_management/data/dto/message_user_and_ai_dto.dart';

part 'history_message_dto.g.dart';
@JsonSerializable()
class HistoryMessageDto {
  final String user_id;
  final List<MessageUserAndAiDto> messages ;
  HistoryMessageDto({required this.user_id , required this.messages});
  factory HistoryMessageDto.fromJson (Map<String , dynamic> json) => _$HistoryMessageDtoFromJson(json);

  Map<String , dynamic> toJson () => _$HistoryMessageDtoToJson(this);
}

