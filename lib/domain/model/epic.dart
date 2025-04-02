import 'package:schedule_gen_and_time_management/data/dto/epic_dto.dart';

class Epic {
  final String id;
  final String nameEpic;
  final String descriptionEpic;
  final String type;

  Epic({
    required this.id,
    required this.nameEpic,
    required this.descriptionEpic,
    required this.type
  });

  factory Epic.fromDto(EpicDto dto) {
    return Epic(id: dto.id, nameEpic: dto.nameEpic, descriptionEpic: dto.description , type: dto.type);
  }
}
