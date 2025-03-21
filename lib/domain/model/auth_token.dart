import 'package:schedule_gen_and_time_management/data/dto/auth_token_dto.dart';

class AuthToken {
  final String token;
  final String refreshToken;

  AuthToken ({required this.token , required this.refreshToken});

  factory AuthToken.fromDto (AuthTokenDto authDto) => 
  AuthToken(token: authDto.token, refreshToken: authDto.refreshToken); 
}