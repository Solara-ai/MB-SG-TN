import 'package:schedule_gen_and_time_management/data/dto/auth_token_dto.dart';

class AuthToken {
  final String token;
  final String refreshToken;
  final String userId;
  final bool rememberMe;

  AuthToken(
      {required this.rememberMe,
      required this.token,
      required this.refreshToken,
      required this.userId});

  factory AuthToken.fromDto(AuthTokenDto authDto) => AuthToken(
      token: authDto.token,
      refreshToken: authDto.refreshToken,
      userId: authDto.userId,
      rememberMe: authDto.rememberMe);
}
