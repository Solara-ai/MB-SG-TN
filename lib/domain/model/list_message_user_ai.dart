import 'package:schedule_gen_and_time_management/data/dto/list_message_user_ai_dto.dart';
import 'package:schedule_gen_and_time_management/domain/model/message_user_and_ai.dart';

class ListMessageUserAi {
  final List<MessageUserAndAi> message;


  ListMessageUserAi({  required this.message});

  factory ListMessageUserAi.fromDto (ListMessageUserAiDto dto) {
    return ListMessageUserAi(message: dto.messages.map((message){
      return MessageUserAndAi.fromDto(message);
    }).toList() );
  }
}