import 'package:json_annotation/json_annotation.dart';
part 'auth_token_dto.g.dart';
@JsonSerializable()
class AuthTokenDto {
  final String token;
  final String refreshToken;
  final String userId ;

  AuthTokenDto({
    required this.token,
    required this.refreshToken,
    required this.userId
  });

  factory AuthTokenDto.fromJson(Map<String, dynamic> json) => _$AuthTokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenDtoToJson(this);
}