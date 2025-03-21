import 'package:json_annotation/json_annotation.dart';
part 'auth_token_dto.g.dart';
@JsonSerializable()
class AuthTokenDto {
  final String token;
  final String refreshToken;

  AuthTokenDto({
    required this.token,
    required this.refreshToken,
  });

  factory AuthTokenDto.fromJson(Map<String, dynamic> json) => _$AuthTokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenDtoToJson(this);
}