import 'package:json_annotation/json_annotation.dart';
part 'detail_epic_dto.g.dart';
@JsonSerializable()
class DetailEpicDto {
  final String id;
  final String nameEpic;
  final String description;
  final String type;

  DetailEpicDto ({required this.id , required this.nameEpic , required this.description , required this.type});

  factory DetailEpicDto.fromJson (Map<String , dynamic> json) => _$DetailEpicDtoFromJson(json);

  Map<String , dynamic> toJson () => _$DetailEpicDtoToJson(this);
  
}