import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class RegisterBloc extends BaseBloc<PageAction , PageEvent , PageState> {

  RegisterBloc() : super (PageState()) {
    on<EventShowPassword> (_handleEventShowPassword);
    on<EventShowConfirmPassword>(_handleEventShowConfirmPassword);
  }

  Future<void> _handleEventShowPassword ( EventShowPassword event, Emitter<PageState> emit) async {
     emit(state.copyWith(dontShowpassword: state.showPassword));
  }

   Future<void> _handleEventShowConfirmPassword ( EventShowConfirmPassword event, Emitter<PageState> emit) async {
     emit(state.copyWith(dontShowConfirmPassword: state.showConfirmPassword));
  }
}