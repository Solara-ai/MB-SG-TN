import 'package:schedule_gen_and_time_management/data/dto/gen_event_ai_dto.dart';
import 'package:schedule_gen_and_time_management/domain/model/category.dart';

class GenEventAi {
  final String eventName;
  final String description;
  final String startTime;
  final String endTime;
  final String date;
  final String enDate;
  final bool remindMe;
  final String repeat;
  final Category categories;

  GenEventAi({
    required this.eventName,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.categories,
    required this.remindMe,
    required this.repeat,
    required this.enDate,
  });

  factory GenEventAi.fromDto(GenEventAiDto dto) => GenEventAi(
        eventName: dto.eventName,
        description: dto.description,
        date: dto.date,
        startTime: dto.startTime,
        endTime: dto.endTime,
        categories: Category.fromDto(dto.categories),
        remindMe: dto.remindMe,
        repeat: dto.repeat,
        enDate: dto.endDate,
      );
}
