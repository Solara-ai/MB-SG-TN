import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/update_schedules_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/repository/schedule_repository.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';

class UpdateScheduleUscase extends ResultUseCase<
    ({
      String scheduleId,
      String name,
      String description,
      DateTime date,
      String repeat,
      DateTime repeatEnddate,
      bool remindMe,
      String categoryId,
      TimeOfDay startTime,
      TimeOfDay endTime,
      String updateType,
      String eventId
    }),
    EmptyData?> {
  final ScheduleRepository _scheduleRepository = GetIt.I<ScheduleRepository>();
  @override
  Future<Result<EmptyData?>> call(
      ({
        String categoryId,
        DateTime date,
        String description,
        TimeOfDay endTime,
        String eventId,
        String name,
        bool remindMe,
        String repeat,
        DateTime repeatEnddate,
        String scheduleId,
        TimeOfDay startTime,
        String updateType
      }) input) {
    final _param = UpdateSchedulesRequest(
        name: input.name,
        description: input.description,
        date: input.date.formatToString(DateFormatType.yyyyMMdd.pattern),
        repeat: input.repeat,
        repeatEndDate: input.repeatEnddate.formatToString(DateFormatType.yyyyMMdd.pattern),
        remindMe: input.remindMe,
        categoryId: input.categoryId,
        startTime: input.startTime.toFormattedString(),
        endTime: input.endTime.toFormattedString(),
        updatedType: input.updateType,
        eventId: input.eventId);
    return _scheduleRepository.upDateSchedule(input.scheduleId , _param );
  }
}
