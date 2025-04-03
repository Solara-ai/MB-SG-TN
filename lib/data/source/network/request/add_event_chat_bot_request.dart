import 'package:json_annotation/json_annotation.dart';
part 'add_event_chat_bot_request.g.dart';
@JsonSerializable()
class AddEventChatBotRequest {
  final String message ;
  AddEventChatBotRequest({required this.message});

  factory  AddEventChatBotRequest.fromJson (Map<String , dynamic> json) => _$AddEventChatBotRequestFromJson(json);

  Map<String , dynamic> toJson () => _$AddEventChatBotRequestToJson(this);
}