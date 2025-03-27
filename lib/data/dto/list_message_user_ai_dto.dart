import 'package:json_annotation/json_annotation.dart';
import 'package:schedule_gen_and_time_management/data/dto/message_user_and_ai_dto.dart';
part 'list_message_user_ai_dto.g.dart';
@JsonSerializable()
class ListMessageUserAiDto {
  final List<MessageUserAndAiDto> messages; 
  ListMessageUserAiDto({ required this.messages });

  factory ListMessageUserAiDto.fromJson (Map<String , dynamic> json) => _$ListMessageUserAiDtoFromJson(json);

  Map<String , dynamic> toJson () => _$ListMessageUserAiDtoToJson(this); 
}