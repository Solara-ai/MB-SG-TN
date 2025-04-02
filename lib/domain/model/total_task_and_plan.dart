import 'package:schedule_gen_and_time_management/data/dto/total_task_and_plan_dto.dart';
import 'package:schedule_gen_and_time_management/domain/model/schedule_by_date.dart';

class TotalTaskAndPlan {
  final String totalTasks;
  final String totalPlans;
  final ScheduleByDate schedule;

  TotalTaskAndPlan({
    required this.totalTasks,
    required this.totalPlans,
    required this.schedule,
  });

  factory TotalTaskAndPlan.fromDto (TotalTaskAndPlanDto dto) {
    return TotalTaskAndPlan(
      totalTasks: dto.totalTasks,
      totalPlans: dto.totalPlans,
      schedule: ScheduleByDate.fromDto(dto.schedule),
    );
  }
}
