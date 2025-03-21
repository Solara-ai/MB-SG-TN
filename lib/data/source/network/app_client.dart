import 'dart:io';

import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/network_extension.dart';
import 'package:schedule_gen_and_time_management/data/source/network/intercreptor/auth_interceptor.dart';
import 'package:schedule_gen_and_time_management/src/env/app_env.dart';
import 'package:schedule_gen_and_time_management/src/utils/scope_ultils.dart';

class AppClient {

   static Dio createAppClient(Alice? alice) {
    final dio = createDio();
    dio.interceptors.addAll([
      AuthInterceptor(),
    ]);
    _addNetworkLoggers(dio, alice);
    return dio;
  }

  static Dio createDio({String? baseURL, String? token}) {
    return Dio(
      BaseOptions(
        // đối với việc cấu hình dio như thế này có nghĩa là khi chúng ta thực hiện call api và tạo ra instance của class AppApi , thì chúng ta sẽ phải truyền Dio vào , và đây chính là cấu hình dio , thực hiện BaseOption bao gồm Header , adtionalHeader
        baseUrl: baseURL ?? AppEnv.config.serverUrl,
        // đối với tham số base Url ở đây sẽ phụ thuộc vào việc chúng ta cấu hình APP ENV theo dạng nào và nó sẽ được xác định trong thời điểm runtime (hay cụ thể ở đây đó chính là việc trong hàm main chúng ta sẽ gọi AppEnv.setupConfig và truyền vào đó là enum Config). giả sử khi chạy app thì main sẽ được gọi đầu tiên và trong đó khi gọ
        sendTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        validateStatus: (status) {
          return status != null && status != HttpStatus.unauthorized && status < 500;
        },
        headers: {
          Headers.contentTypeHeader: Headers.jsonContentType,
        }
      ) ..addAuthHeader(token)
        ..addAdditionalHeader(),
    );
  }

    //******************************************************************************
  // Logger
  //******************************************************************************

  static bool get showNetworkLogs => kDebugMode || AppEnv.config == DevConfig();

  static Alice? get createAliceLogger =>
      showNetworkLogs ? Alice(showNotification: false, showInspectorOnShake: true) : null;

  static GlobalKey<NavigatorState>? get loggerNavigatorKey =>
      showNetworkLogs ? GetIt.I.get<Alice>().getNavigatorKey() : null;

  static void setLoggerNavigatorKey(GlobalKey<NavigatorState> key) {
    if (showNetworkLogs) {
      GetIt.I.get<Alice>().setNavigatorKey(key);
    }
  }

  static void handleNetworkLogs() {
    if (showNetworkLogs) {
      GetIt.I<Alice>().showInspector();
    }
  }

  static void _addNetworkLoggers(Dio dio, Alice? alice) {
    alice?.let((alice) {
      final logger = PrettyDioLogger(requestHeader: true, requestBody: true);
      dio.interceptors.add(alice.getDioInterceptor());
      dio.interceptors.add(logger);
    });
  }
}
