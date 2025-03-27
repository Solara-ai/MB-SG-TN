import 'package:schedule_gen_and_time_management/data/dto/history_message_dto.dart';
import 'package:schedule_gen_and_time_management/domain/model/message_user_and_ai.dart';

class HistoryMesssage {
  final List<MessageUserAndAi> message;
  HistoryMesssage({required this.message});
  factory HistoryMesssage.fromDTO(HistoryMessageDto dto) => HistoryMesssage(message: dto.messages.map((value){
    return MessageUserAndAi.fromDto(value);
  }).toList()) ;
}