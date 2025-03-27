import 'package:schedule_gen_and_time_management/data/dto/message_user_and_ai_dto.dart';

class MessageUserAndAi {
  final String text;
  final String reply;
  MessageUserAndAi({required this.text , required this.reply });

  factory MessageUserAndAi.fromDto (MessageUserAndAiDto dto) => MessageUserAndAi(text: dto.text, reply: dto.reply);
}