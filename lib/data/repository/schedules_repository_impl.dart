import 'package:schedule_gen_and_time_management/data/dto/detail_schedules_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/gen_event_ai_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/schedule_data_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/schedules_by_date_dto.dart';
import 'package:schedule_gen_and_time_management/data/repository/base/base_network_repository.dart';
import 'package:schedule_gen_and_time_management/data/source/network/app_api.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_schedules_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/update_schedules_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/repository/schedule_repository.dart';

class SchedulesRepositoryImpl extends BaseNetworkRepository implements ScheduleRepository {
  final AppApi _api;

  SchedulesRepositoryImpl(this._api);

  @override
  Future<Result<EmptyData?>> createSchedule(CreateSchedulesRequest param) {
    return execute(_api.createSchedule(param));
  }

  @override
  Future<Result<EmptyData?>> deleteScheduleByEventId(String eventId) {
    return execute(_api.deleteScheduleByEventId(eventId));
  }

  @override
  Future<Result<List<SchedulesByDateDto>>> getListScheduleByDate(String date) {
    return execute(_api.getListScheduleByDate(date));
  }

  @override
  Future<Result<DetailSchedulesDto>> getSchedulesByEventId(String eventId) {
    return execute(_api.getSchedulesByEventId(eventId));
  }

  @override
  Future<Result<EmptyData?>> upDateSchedule(String scheduleId, UpdateSchedulesRequest param) {
    return execute(_api.upDateSchedule(scheduleId, param));
  }


  @override
  Future<Result<List<ScheduleDataDto>>> getListDataSchedule(int year, int month) {
    return execute(_api.getListDataSchedule(year, month));
  }

  @override
  Future<Result<GenEventAiDto>> genEventAi(String message) {
    return execute(_api.genEventAI(message));
  }
}
