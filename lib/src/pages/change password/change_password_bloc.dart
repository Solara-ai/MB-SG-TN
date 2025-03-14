import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class ChangePasswordBloc extends BaseBloc<PageAction , PageEvent , PageState> {
   ChangePasswordBloc () :super (PageState()) {
     on<EventShowNewPassword> (_handleShowNewPassword);
     on <EventShowConfirmNewPassword> (_handleShowConfirmNewPassword);
     on <EventChangePassword> (_handleChangePassword);
   }

   Future<void> _handleShowNewPassword (EventShowNewPassword event , Emitter<PageState> emit) async {
      emit(state.copyWith(dontShowNewPassword: state.showNewPassword));
   }
   Future <void> _handleShowConfirmNewPassword (EventShowConfirmNewPassword event , Emitter<PageState> emit) async {
      emit(state.copyWith(dontShowConfirmNewPassword: state.showConfirmNewPassword));
   }
   Future <void> _handleChangePassword (EventChangePassword event , Emitter <PageState> emit )async {
     addAction(ActionChangePasswordSuccess());
   }
   
}