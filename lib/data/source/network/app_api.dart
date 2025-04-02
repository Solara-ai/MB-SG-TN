import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:schedule_gen_and_time_management/data/dto/auth_token_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/category_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/detail_schedules_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/detail_task_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/epic_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/history_message_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/list_message_user_ai_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/list_task_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/schedule_data_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/schedules_by_date_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/total_task_and_plan_dto.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_category_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_epic_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_schedules_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_task_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/login_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/message_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/register_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/update_profile_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/update_schedules_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/api_response.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/data/dto/user_profile_dto.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @POST('/users/auth')
  Future<ApiResponse<AuthTokenDto>> loginWithEmail(@Body() LoginUserRequest param);

  @POST('/users/auth/register')
  Future<ApiResponse<EmptyData?>> registerUser(@Body() RegisterUserRequest param);

  @POST('/ai/chat')
  Future<ApiResponse<ListMessageUserAiDto>> userChatAi(@Body() MessageUserRequest param);

  @GET('/ai/chat/history/{user_id}')
  Future<ApiResponse<HistoryMessageDto>> historyMessage(@Path('user_id') String user_id);

  @GET('/users/profile')
  Future<ApiResponse<UserProfileDto>> getmyProfile();

  @PUT('/users/profile') 
  Future<ApiResponse<EmptyData?>> updateProfile(@Body() UpdateProfileRequest param);

  @POST('/users/category')
  Future<ApiResponse<EmptyData?>> createCategory(@Body() CreateCategoryRequest param);

  @GET('/users/category')
  Future<ApiResponse<List<CategoryDto>>> getListCategory();

  @PUT('/users/schedules/{ScheduleId}')
  Future<ApiResponse<EmptyData?>> upDateSchedule(
      @Path('ScheduleId') String scheduleId, @Body() UpdateSchedulesRequest param);

  @POST('/users/schedules')
  Future<ApiResponse<EmptyData?>> createSchedule(@Body() CreateSchedulesRequest param);

  @GET('/users/schedules/{eventId}')
  Future<ApiResponse<DetailSchedulesDto>> getSchedulesByEventId(@Path('eventId') String eventId);

  @DELETE('/users/schedules/{eventId}')
  Future<ApiResponse<EmptyData?>> deleteScheduleByEventId(@Path('eventId') String eventId);

  @GET('/users/schedules/date')
  Future<ApiResponse<List<SchedulesByDateDto>>> getListScheduleByDate(@Query('date') String date);

  @GET('/users/schedules')
  Future<ApiResponse<List<ScheduleDataDto>>> getListDataSchedule(
    @Query("year") int year,
    @Query("month") int month,
  );

  @POST('/users/epic')
  Future<ApiResponse<EmptyData?>> createEpic(@Body() CreateEpicRequest param);

  @GET('/users/epic')
  Future<ApiResponse<List<EpicDto>>> getListEpic(@Query('type') String? param);

  @GET('/users/epic/{epicId}/tasks')
  Future<ApiResponse<ListTaskDto>> getListTaskByEpicId(@Path('epicId') String epicId);

  @GET('/users/epic/{epicId}')
  Future<ApiResponse<EpicDto>> detailEpic(@Path('epicId') String epicId);

  @POST('/users/epic/{epicId}')
  Future<ApiResponse<EmptyData?>> createTask(
    @Path('epicId') String epicId,
    @Body() CreateTaskRequest param,
  );

  @GET('/users/epic/{epicId}/tasks/{taskId}') 
  Future<ApiResponse<DetailTaskDto>> detailTask(
    @Path('epicId') String epicId,
    @Path('taskId') String taskId,
  );

  @DELETE('/users/epic/{epicId}/tasks/{taskId}')
  Future<ApiResponse<EmptyData?>> deleteTask (@Path('epicId') String epicId , @Path('taskId') String taskId);

  @DELETE('/users/epic/{epicId}') 
  Future<ApiResponse<EmptyData?>> deleteEpic (@Path('epicId') String epicId );

  @GET('/users/epic/total') 
  Future<ApiResponse<TotalTaskAndPlanDto>> getTotalTaskAndPlan (@Query('date') String date);
  
}
