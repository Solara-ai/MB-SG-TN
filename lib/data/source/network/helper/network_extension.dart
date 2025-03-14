
import 'package:dio/dio.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/network_constant.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/system_ultils.dart';



extension NetworkStringExtension on String? {
  String get bearerToken => 'Bearer $this';
}

extension NetworkRequestOptionsExtension on RequestOptions {
  void addAuthHeader(String? token) {
    if (!token.isNullOrEmpty()) {
      headers[ApiHeaders.AUTHORIZATION] = token.bearerToken;
    }
  }

  void addAdditionalHeader() {
    headers[ApiHeaders.TIME_ZONE] = DateTime.now().timeZoneName;
    headers[ApiHeaders.DEVICE] = SystemUltils.deviceHeader;
  }
}

extension NetworkBaseOptionsExtension on BaseOptions {
  void addAuthHeader(String? token) {
    if (!token.isNullOrEmpty()) {
      headers[ApiHeaders.AUTHORIZATION] = token.bearerToken;
    }
  }

  void addAdditionalHeader() {
    headers[ApiHeaders.TIME_ZONE] = DateTime.now().timeZoneName;
    headers[ApiHeaders.DEVICE] = SystemUltils.deviceHeader;
  }
}
