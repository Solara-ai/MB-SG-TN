import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/login_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/session_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class LoginBloc extends BaseBloc<PageAction , PageEvent, PageState> {
  final LoginUsecase _loginUseCase = GetIt.I<LoginUsecase>();
  final SessionUsecase _sessionUsecase = GetIt.I<SessionUsecase>();
  LoginBloc () : super (PageState()) {
    on<EventShowPassword> (_handleShowpassword);
    on<EventEmailSubmited> (_handleSubmitedEmail);
    on<EventPasswordSubmited> (_handleSubmitedPassword);
    on<EventHandleLogin> (_handleLogin);
  }
  Future<void> _handleShowpassword (EventShowPassword event , Emitter<PageState> emit) async {
    emit(state.copyWith(showPassword: state.showPassword()));  
  }

  Future<void> _handleSubmitedEmail (EventEmailSubmited event , Emitter<PageState> emit ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _handleSubmitedPassword (EventPasswordSubmited event , Emitter<PageState> emit ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _handleLogin (EventHandleLogin event , Emitter <PageState> emit ) async{
      emit(state.copyWith(showLoading: true));
      final result = await _loginUseCase.call((email: state.email , password: state.password));
      await result.when(success: (data) {
        _sessionUsecase.saveToken(data.token, data.refreshToken);
        addAction(ActionLoginSuccessFull());
      }, failure: (error) {
        addAction(ActionShowError(error.errorMessage));
      }).whenComplete(() => emit(state.copyWith(showLoading: false)));
  }

}