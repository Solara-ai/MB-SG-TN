import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/model/user_profile.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/session_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/user/get_profile_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';
part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';
class DrawerBloc extends BaseBloc<PageAction , PageEvent , PageState> {
  final GetProfileUsecase _getProfileUsecase = GetIt.I<GetProfileUsecase>();
  final SessionUsecase _sessionUsecase = GetIt.I<SessionUsecase>();
  DrawerBloc () :super (PageState()) {
    on<EventNavigateHomePage>(_handleEventNavigateHomePage);
    on<EventNavigateTaskManagePage> (_handleEventNavigateTaskManagePage);
    on<EventNavigateSettingsPage> (_handleEventNavigateSettingPage);
    on<EventNavigateSchedulePage> (_handleEventNavigateSchedulePage);
    on<EventNavigateEditProfilePage> (_handeEventNavigateEditProfilePage);
    on<EventNavigatePerfomanceEvaluation> (_EventNavigatePerformance);
    on<EventLogout> (_handleEventLogout);
    on<EventInitilize> (_handleEventInitilize);
    initilize();
  }

  void initilize () {
    add(EventInitilize());
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

  Future<void> _EventNavigatePerformance (EventNavigatePerfomanceEvaluation event , Emitter emit) async{
    addAction(ActionNavigatePerformance());
  }

  Future<void> _handeEventNavigateEditProfilePage (EventNavigateEditProfilePage event , Emitter emit) async{
    addAction(ActionNavigateEditProfilePage());
  }

  Future<void> _handleEventInitilize (EventInitilize event , Emitter emit) async{
    final result = await _getProfileUsecase.call(());
    result.when(success: (data) {
      emit(state.copyWith(userProfile: data));
    }, failure: (error){

    });
  }

}