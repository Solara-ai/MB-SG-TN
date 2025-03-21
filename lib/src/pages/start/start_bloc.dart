import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class StartBloc extends BaseBloc<PageAction , PageEvent , PageState> {
  StartBloc () :super (PageState()) {
    on<EventNavigateLoginPage> (_handleEventNavigateLoginPage);
    on <EventNavigateRegisterPage> (_handleEventNavigateRegisterPage);
    on <EventNavigateSuccess> (_handleEventNavigateSuccess);
  }

  Future<void> _handleEventNavigateLoginPage (EventNavigateLoginPage event , Emitter emit) async{
      emit (state.copyWith(showLoading: true));
      addAction(ActionNavigateLoginPage());
  }

  Future<void> _handleEventNavigateRegisterPage (EventNavigateRegisterPage event , Emitter emit) async{
      emit (state.copyWith(showLoading: true));
      addAction(ActionNavigateRegisterPage());   
  }

  Future<void> _handleEventNavigateSuccess (EventNavigateSuccess event , Emitter emit) async{
    emit (state.copyWith(showLoading: false));
  }
}