import 'package:json_annotation/json_annotation.dart';
import 'package:schedule_gen_and_time_management/data/dto/schedules_by_date_dto.dart';
part 'total_task_and_plan_dto.g.dart';
@JsonSerializable()
class TotalTaskAndPlanDto {
  final String totalTasks;
  final String totalPlans;
  final SchedulesByDateDto schedule ;

  TotalTaskAndPlanDto({required this.totalTasks , required this.totalPlans , required this.schedule});

  factory TotalTaskAndPlanDto.fromJson (Map<String , dynamic> json) => _$TotalTaskAndPlanDtoFromJson (json);

  Map<String , dynamic> toJson () => _$TotalTaskAndPlanDtoToJson (this);

}