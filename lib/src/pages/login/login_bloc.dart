import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class LoginBloc extends BaseBloc<PageAction , PageEvent, PageState> {
  LoginBloc () : super (PageState()) {
    on<EventShowPassword> (_handleShowpassword);
  }
  Future<void> _handleShowpassword (EventShowPassword event , Emitter<PageState> emit) async {
    emit(state.copyWith(showPassword: state.showPassword()));  
  }
}