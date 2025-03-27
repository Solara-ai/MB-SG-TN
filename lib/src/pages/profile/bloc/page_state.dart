part of '../profile_bloc.dart';
class PageState {
  final UserProfile ? userProfile;
  PageState({this.userProfile});

  PageState copyWith ({UserProfile ? userProfile}) {
    return PageState(userProfile: userProfile ?? this.userProfile);
  }
}