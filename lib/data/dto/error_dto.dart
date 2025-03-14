import 'package:json_annotation/json_annotation.dart';

part 'error_dto.g.dart';

@JsonSerializable()
class ErrorDto {
  final int status;
  final String code;
  final String message;

  ErrorDto({
    required this.status,
    required this.code,
    required this.message,
  });

  factory ErrorDto.fromJson(Map<String, dynamic> json) => _$ErrorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDtoToJson(this);
}