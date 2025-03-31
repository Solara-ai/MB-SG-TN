import 'package:schedule_gen_and_time_management/data/dto/schedule_data_dto.dart';

class ScheduleData {
  final String date;
  final List<String> categoryColor;
  ScheduleData({required this.date , required this.categoryColor});

  factory ScheduleData.fromDto (ScheduleDataDto dto) => ScheduleData(date: dto.date, categoryColor: dto.categoryColor);
}