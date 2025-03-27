import 'package:json_annotation/json_annotation.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/network_constant.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
// genericArgumentFactories: true được sử dụng để Khi gọi ApiResponse.fromJson(json, fromJsonT), bạn phải cung cấp một function để chuyển đổi T từ JSON.
// Điều này giúp Dart biết cách chuyển đổi kiểu dữ liệu cụ thể cho T.

class ApiResponse<T> {
  final String ? resultCode;
  final int httpStatus;
  final String ? resultMsg;
  final String ? resourceId;
  final String responseTimestamp;
  final T? data;

  ApiResponse({
    required this.resultCode,
    required this.httpStatus,
    required this.resultMsg,
    required this.resourceId,
    required this.responseTimestamp,
    required this.data
  });


  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$ApiResponseToJson(this, toJsonT);

  bool get isSuccess => httpStatus == ResponseStatus.STATUS_SUCCESSFUL;
  bool get isCreated => httpStatus == ResponseStatus.STATUS_CREATE;
}