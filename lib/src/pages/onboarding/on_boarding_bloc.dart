import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/session_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class OnBoardingBloc extends BaseBloc <PageAction , PageEvent , PageState>{
  final SessionUsecase _sessionUsecase = GetIt.I<SessionUsecase>();
  OnBoardingBloc () : super (PageState()) {
    on<EventSkipOnboarding>(_hanDleEventSkipOnboarding);
    on<EventGotoScerrenChat>(_hanDleEventNavigateChatPage);
  }

  Future<void> _hanDleEventSkipOnboarding (EventSkipOnboarding event , Emitter emit) async{
    emit(state.coppyWith(showLoading: true));
    _sessionUsecase.saveShowIntro(false);
    addAction(ActionNavigateHomePage());
  }

  Future<void> _hanDleEventNavigateChatPage (EventGotoScerrenChat event , Emitter emit) async{
    emit(state.coppyWith(showLoading: true));
    addAction(ActionNavigateChatPage());
  }

}