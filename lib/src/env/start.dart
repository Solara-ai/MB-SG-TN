import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/data/di/service_locator.dart' as data_service_locator;
import 'package:schedule_gen_and_time_management/domain/di/service_locator.dart' as domain_service_locator;
import 'package:schedule_gen_and_time_management/src/app.dart';

Future<void> start () async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureDependencies();
  runApp(App());
}

Future<void> _configureDependencies () async {
  await data_service_locator.configureDependencies();
  await domain_service_locator.configureDependencies();
}
