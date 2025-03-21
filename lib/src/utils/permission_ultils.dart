import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/widgets/dialogs/permission_dialog.dart';

enum PermissionTypeEnum {
  photos,
  camera,
}

extension PermissionTypeEnumExtension on PermissionTypeEnum {
  String get title {
    switch (this) {
      case PermissionTypeEnum.camera:
        return R.strings.permision_camera_title;
      case PermissionTypeEnum.photos:
        return R.strings.permision_photo_title;
    }
  }

  String get description {
    switch (this) {
      case PermissionTypeEnum.camera:
        return R.strings.permision_camera_desscription;
      case PermissionTypeEnum.photos:
        return R.strings.permision_photos_desscription;
    }
  }
}

class AppPermissionUtils {
  const AppPermissionUtils._();

  static Future<PermissionStatus> _getStoragePermissionStatus() async {
    if (Platform.isAndroid) {
      ///For android >= 13 (sdk >= 33)
      var result = await Permission.photos.request();
      if (result.isDenied) {
        ///For android < 13 (sdk < 33)
        result = await Permission.storage.request();
      }
      return result;
    } else {
      return Permission.photos.request();
    }
  }

  static Future<PermissionStatus> _getCameraPermissionStatus() async {
    if (Platform.isIOS) {
      return Permission.camera.request();
    } else {
      return PermissionStatus.granted;
    }
  }

  // ignore: unused_element
  static Future<PermissionStatus> _getLocationPermissionStatus() async {
    return Permission.location.request();
  }

  static Future<bool> hasStoragePermission(BuildContext context) async {
    final PermissionStatus status = await _getStoragePermissionStatus();
    return _checkPermission(
      context,
      status: status,
      permissionType: PermissionTypeEnum.photos,
    );
  }

  static Future<bool> hasCameraPermission(BuildContext context) async {
    final PermissionStatus status = await _getCameraPermissionStatus();
    return _checkPermission(
      context,
      status: status,
      permissionType: PermissionTypeEnum.camera,
    );
  }

  

  static Future<bool> _checkPermission(
    BuildContext context, {
    required PermissionStatus status,
    required PermissionTypeEnum permissionType,
  }) async {
    switch (status) {
      case PermissionStatus.granted:
      case PermissionStatus.limited:
        return true;
      case PermissionStatus.denied:
        return false;
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.restricted:

        /// If user permanently denied Storage permission, we need to show a dialog to open App Settings.
        final result = await showDialog<bool?>(
          context: context,
          builder: (context) => PermissionDialogWidget(
            title: R.strings.permission_not_granted_title(arg1: permissionType.title),
            description: R.strings.permission_not_granted_description(
              permisionName: permissionType.title,
              permissionDetail: permissionType.description,
            ),
          ),
        );
        if (result == true) {
          return openAppSettings();
        }
        return false;
      default:
        return false;
    }
  }
}
