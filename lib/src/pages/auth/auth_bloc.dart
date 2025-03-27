
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/session_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';
part 'bloc/auth_action.dart';
part 'bloc/auth_event.dart';
part 'bloc/auth_state.dart';
class AuthBloc extends BaseBloc<AuthAction , AuthEvent , AuthState> {
    final SessionUsecase _sessionUsecase = GetIt.I<SessionUsecase>();
  AuthBloc () : super (AuthState()) {
    on<EventRefreshSession> (_refreshSession);
    on<EventLogout> (_onLogout);
  }

  Future<void> _refreshSession(EventRefreshSession event, Emitter<AuthState> emit) async {
    final bool isLoggedIn = _sessionUsecase.isLoggedIn;
    print("Session isLoggedIn before emit: $isLoggedIn"); // In giá trị trước emit

    emit(state.copyWith(hasInitialed: true, isLoggedIn: isLoggedIn));

    await Future.delayed(Duration(milliseconds: 100));
    print("AuthBloc state after emit: ${state.isLoggedIn}"); // Kiểm tra state sau emit
}

   Future<void> _onLogout(EventLogout event, Emitter<AuthState> emit) async {
    if (!state.isLoggedIn) {
      return;
    }
    _sessionUsecase.clearSession();
    add(EventRefreshSession());
  }
}