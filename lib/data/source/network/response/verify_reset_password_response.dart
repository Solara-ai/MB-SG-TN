import 'package:json_annotation/json_annotation.dart';
part 'verify_reset_password_response.g.dart';

@JsonSerializable()
class VerifyResetPasswordResponse {
  final String token;

  VerifyResetPasswordResponse({
    required this.token,
  });

  factory VerifyResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetPasswordResponseToJson(this);
}