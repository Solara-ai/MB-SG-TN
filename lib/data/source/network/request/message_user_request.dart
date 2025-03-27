import 'package:json_annotation/json_annotation.dart';
part 'message_user_request.g.dart';
@JsonSerializable()
class MessageUserRequest {
  final String user_id ;
  final String text ;

  MessageUserRequest ({required this.user_id , required this.text});

  factory MessageUserRequest.fromJson(Map<String , dynamic> json) => _$MessageUserRequestFromJson(json);  
  Map<String , dynamic> toJson () => _$MessageUserRequestToJson(this);
}