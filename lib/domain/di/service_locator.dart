import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/add_event_chat_bot_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_epic_request.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/login_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/register_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/category/create_category_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/category/get_list_category_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/chat/add_event_chatbot_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/chat/history_chat_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/chat/user_chat_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/epic/create_epic_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/epic/delete_epic_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/epic/detail_epic_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/epic/getListEpic_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/epic/total_task_and_plan_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/schedules/create_schedule_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/schedules/deleted_schedule_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/schedules/gen_event_ai_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/schedules/get_list_schedule_by_date_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/schedules/get_list_schedule_data_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/schedules/get_schedule_by_eventId_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/schedules/update_schedule_uscase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/task/create_task_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/task/delete_task_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/task/detai_task_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/task/get_list_task_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/user/evaluate_schedule_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/user/get_profile_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/user/send_feed_back_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/user/update_profile_usecase.dart';
import 'package:schedule_gen_and_time_management/src/pages/schedules/schedule_bloc.dart';

part 'dependence/usecase_di.dart';
Future<void> configureDependencies() async {
  await configureUsecaseDependencies();
}