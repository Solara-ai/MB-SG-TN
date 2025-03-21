part of '../auth_bloc.dart';
class AuthState {
  final bool isLoggedIn;
  AuthState({
    this.isLoggedIn = false,
  });
  AuthState copyWith({
    bool? hasInitialed,
    bool? isLoggedIn,

  }) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
