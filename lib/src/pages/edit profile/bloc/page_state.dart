part of '../edit_profile_bloc.dart';

class PageState {
  final bool showLoading;
  final String fullName;
  final String phone;
  final DateTime birthDay;
  final String gender;
  final String hobbies;
  final String password;
  final bool requiredPasswordAgain;
  final bool requiredPassword;
  final String occupation;
  final String email;
  final UserProfile? userProfile;

  PageState(
      {this.fullName = '',
      this.requiredPassword = false,
      this.phone = '',
      this.requiredPasswordAgain = false ,
      this.email = '',
      this.showLoading = false,
      DateTime? birthDay,
      this.gender = '',
      this.hobbies = '',
      this.password = '',
      this.occupation = '',
      this.userProfile})
      : birthDay = birthDay ?? DateTime(2025);

  PageState copyWith(
          {String? fullName,
          bool ? requiredPassword,
        bool ? requiredPasswordAgain,
          String ? email ,
          String? phone,
          bool? showLoading,
          DateTime? birthDay,
          String? gender,
          String? hobbies,
          String? password,
          String? occupation,
          UserProfile? userprofile}) =>
      PageState(
          requiredPassword: requiredPassword ?? this.requiredPassword,
          requiredPasswordAgain: requiredPasswordAgain ?? this.requiredPasswordAgain,
          email: email ?? this.email,
          showLoading: showLoading ?? this.showLoading,
          fullName: fullName ?? this.fullName,
          phone: phone ?? this.phone,
          birthDay: birthDay ?? this.birthDay,
          gender: gender ?? this.gender,
          hobbies: hobbies ?? this.hobbies,
          password: password ?? this.password,
          occupation: occupation ?? this.occupation,
          userProfile: userprofile ?? this.userProfile);
}
