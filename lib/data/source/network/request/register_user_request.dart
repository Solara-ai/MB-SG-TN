
import 'package:json_annotation/json_annotation.dart';

part 'register_user_request.g.dart';

@JsonSerializable()
class RegisterUserRequest {
  final String fullName;
  final String email;
  final String phone;
  final String gender;
  final String hobbies;
  final String occupation;
  final String birthday;
  final String password;

  RegisterUserRequest({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.hobbies,
    required this.occupation,
    required this.birthday,
    required this.password,
  });

  factory RegisterUserRequest.fromJson(Map<String , dynamic> json) =>  _$RegisterUserRequestFromJson(json);

  Map<String , dynamic> toJson() => _$RegisterUserRequestToJson(this);  
}
