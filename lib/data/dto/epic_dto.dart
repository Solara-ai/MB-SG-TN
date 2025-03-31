import 'package:json_annotation/json_annotation.dart';
part 'epic_dto.g.dart';
@JsonSerializable()
class EpicDto {
  final String id;
  final String nameEpic;
  final String description;
  final String type;

  EpicDto({required this.id , required this.nameEpic , required this.description , required this.type});

  factory EpicDto.fromJson(Map<String , dynamic> json) => _$EpicDtoFromJson(json);

  Map<String , dynamic> toJson () => _$EpicDtoToJson (this);

}