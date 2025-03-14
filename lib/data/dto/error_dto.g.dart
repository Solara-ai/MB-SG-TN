// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDto _$ErrorDtoFromJson(Map<String, dynamic> json) => ErrorDto(
      status: (json['status'] as num).toInt(),
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorDtoToJson(ErrorDto instance) => <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
