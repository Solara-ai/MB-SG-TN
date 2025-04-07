import 'package:json_annotation/json_annotation.dart';
import 'package:schedule_gen_and_time_management/data/dto/category_dto.dart';

part 'gen_event_ai_dto.g.dart';

@JsonSerializable()
class GenEventAiDto {
  final String eventName;
  final String description;
  final String startTime;
  final String endTime;
  final String date;
  final String endDate;
  final bool remindMe;
  final String repeat;
  final CategoryDto categories;

  GenEventAiDto({
    required this.eventName,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.categories,
    required this.remindMe,
    required this.repeat,
    required this.endDate,
  });

  factory GenEventAiDto.fromJson(Map<String, dynamic> json) =>
      _$GenEventAiDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GenEventAiDtoToJson(this);
}