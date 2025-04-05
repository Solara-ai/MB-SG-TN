import 'package:json_annotation/json_annotation.dart';
part 'send_feed_back_request.g.dart';

@JsonSerializable()
class SendFeedBackRequest {
  final String message;

  SendFeedBackRequest({required this.message});

  factory SendFeedBackRequest.fromJson(Map<String, dynamic> json) =>
      _$SendFeedBackRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendFeedBackRequestToJson(this);
}