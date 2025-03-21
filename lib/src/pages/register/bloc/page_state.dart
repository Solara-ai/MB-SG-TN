part of '../register_bloc.dart';

class PageState {
  final bool showLoading;
  final bool dontShowPassword;
  final bool dontShowConfirmPassword;
  final String fullName;
  final String email;
  final String conFirmPassword;
  final String gender;
  final String phoneNumber;
  final String hobbies;
  final DateTime dateOfBirthd;
  final String occupation;

  PageState(
      {this.showLoading = false,
      this.dontShowPassword = true,
      this.dontShowConfirmPassword = true,
      this.fullName = '',
      this.email = '',
      this.conFirmPassword= '',
      DateTime? dateOfBirthd,
      this.gender= '',
      this.hobbies= '',
      this.occupation= '',
      this.phoneNumber= ''}) : dateOfBirthd = dateOfBirthd ?? DateTime(2000, 1, 1);

  PageState copyWith(
      {bool? showloading,
      bool? dontShowpassword,
      bool? dontShowConfirmPassword,
      String? fullName,
      String? email,
      String? conFirmPassword,
      String? gender,
      String? phoneNumber,
      String? hobbies,
      DateTime? dateOfBirthd,
      String? occupation}) {
    return PageState(
        showLoading: showloading ?? this.showLoading,
        dontShowPassword: dontShowpassword ?? this.dontShowPassword,
        dontShowConfirmPassword: dontShowConfirmPassword ?? this.dontShowConfirmPassword,
        fullName: fullName ?? this.fullName,
        email : email ?? this.email ,
        conFirmPassword: conFirmPassword ?? this.conFirmPassword,
        gender:  gender ?? this.gender , 
        phoneNumber:  phoneNumber ?? this.phoneNumber,
        hobbies: hobbies ?? this.hobbies,
        dateOfBirthd: dateOfBirthd ?? this.dateOfBirthd ,
        occupation: occupation ?? this.occupation
        );
  }

  bool get showPassword => dontShowPassword != true;

  bool get showConfirmPassword => dontShowConfirmPassword != true;
}
