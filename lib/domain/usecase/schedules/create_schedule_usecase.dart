import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_schedules_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/repository/schedule_repository.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';

class CreateScheduleUsecase extends ResultUseCase<
    ({
      String name,
      String description,
      DateTime date,
      String repeat,
      DateTime repeatEndDate,
      bool remindMe,
      String categoryId,
      TimeOfDay startTime,
      TimeOfDay endTime
    }),
    EmptyData?> {
  final ScheduleRepository _schedulesRepository = GetIt.I<ScheduleRepository>();
  @override
  Future<Result<EmptyData?>> call(
      ({
        String categoryId,
        DateTime date,
        String description,
        TimeOfDay endTime,
        String name,
        bool remindMe,
        String repeat,
        DateTime repeatEndDate,
        TimeOfDay startTime
      }) input) {
    final _param = CreateSchedulesRequest(
        name: input.name,
        description: input.description,
        date: input.date.formatToString(DateFormatType.yyyyMMdd.pattern),
        repeat: input.repeat,
        repeatEndDate: input.repeatEndDate.formatToString(DateFormatType.yyyyMMdd.pattern),
        remindMe: input.remindMe,
        categoryId: input.categoryId,
        startTime: input.startTime.toFormattedString(),
        endTime: input.endTime.toFormattedString());
    return _schedulesRepository.createSchedule(_param);
  }
}
