import 'package:json_annotation/json_annotation.dart';
part 'create_epic_request.g.dart';
@JsonSerializable()
class CreateEpicRequest {
  final String name;
  final String description;
  final String type;

  CreateEpicRequest({required this.name , required this.description , required this.type});

  factory CreateEpicRequest.fromJson(Map<String , dynamic> json) => _$CreateEpicRequestFromJson (json);

  Map<String , dynamic> toJson () => _$CreateEpicRequestToJson (this); 
}