import 'package:json_annotation/json_annotation.dart';
part 'event_time_dto.g.dart';
@JsonSerializable()
class EventTimeDto {
  final double workStudy;
  final double entertainmentRelaxation;
  final double physicalHealth;
  final double others;

  EventTimeDto({required this.workStudy , required this.entertainmentRelaxation , required this.physicalHealth, required this.others});

  factory EventTimeDto.fromJson (Map<String , dynamic> json) => _$EventTimeDtoFromJson(json);

  Map<String , dynamic> toJson () => _$EventTimeDtoToJson(this);

}