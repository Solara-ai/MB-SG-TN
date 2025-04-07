import 'package:schedule_gen_and_time_management/data/dto/detail_schedules_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/gen_event_ai_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/schedule_data_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/schedules_by_date_dto.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_schedules_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/update_schedules_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';

abstract class ScheduleRepository {
  Future<Result<EmptyData?>> upDateSchedule (String scheduleId , UpdateSchedulesRequest param);
  Future<Result<EmptyData?>> createSchedule (CreateSchedulesRequest param);
  Future<Result<DetailSchedulesDto>> getSchedulesByEventId (String eventId);
  Future <Result<EmptyData?>> deleteScheduleByEventId (String eventId);
  Future <Result<List<SchedulesByDateDto>>> getListScheduleByDate (String date);
  Future<Result<List<ScheduleDataDto>>> getListDataSchedule (int year, int month);
  Future<Result<GenEventAiDto>> genEventAi (String message);
}