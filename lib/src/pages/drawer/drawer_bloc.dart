import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/session_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';
part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';
class DrawerBloc extends BaseBloc<PageAction , PageEvent , PageState> {
  final SessionUsecase _sessionUsecase = GetIt.I<SessionUsecase>();
  DrawerBloc () :super (PageState()) {
    on<EventNavigateHomePage>(_handleEventNavigateHomePage);
    on<EventNavigateTaskManagePage> (_handleEventNavigateTaskManagePage);
    on<EventNavigateSettingsPage> (_handleEventNavigateSettingPage);
    on<EventNavigateSchedulePage> (_handleEventNavigateSchedulePage);
    on<EventNavigateEditProfilePage> (_handeEventNavigateEditProfilePage);
    on<EventLogout> (_handleEventLogout);
  }

  Future<void> _handleEventNavigateHomePage (EventNavigateHomePage event , Emitter emit) async{
     addAction(ActionNavigateHomePage());
  }

  Future<void> _handleEventNavigateTaskManagePage (EventNavigateTaskManagePage event , Emitter emit) async{
    addAction(ActionNavigateTaskManagePage());
  }

   Future<void> _handleEventNavigateSettingPage (EventNavigateSettingsPage event , Emitter emit) async{
    addAction(ActionNavigateSettingsPage());
  }

   Future<void> _handleEventNavigateSchedulePage (EventNavigateSchedulePage event , Emitter emit) async{
    addAction(ActionNavigateSchedulesPage());
  }

  Future<void> _handleEventLogout (EventLogout event , Emitter emit) async{
    _sessionUsecase.clearSession();
    addAction(ActionLogout());
  }

  Future<void> _handeEventNavigateEditProfilePage (EventNavigateEditProfilePage event , Emitter emit) async{
    addAction(ActionNavigateEditProfilePage());
  }


}