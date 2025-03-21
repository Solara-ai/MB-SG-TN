import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/permission_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';

const double maxWidthResolution = 800;
const double maxHeightResolution = 800;

class CustomImagePicker {
  CustomImagePicker._();

  static final ImagePicker _picker = ImagePicker();

  static Future<List<XFile>?> pickImagesFromLibrary({
    required BuildContext context,
    double? width,
    double? height,
  }) async {
    try {
      final hasPermission = await AppPermissionUtils.hasStoragePermission(context);
      if (!hasPermission) {
        return null;
      }
      final pickedFiles = await _picker.pickMultiImage(
        maxWidth: maxWidthResolution,
        maxHeight: maxHeightResolution,
      );
      if (pickedFiles.isEmpty) {
        return null;
      }
      final bool hasGifImage = pickedFiles.any((file) => file.path.endsWith('.gif'));
      if (hasGifImage) {
        ToastUtils.showErrorToast(
          context,
          message: R.strings.image_picked_invalid,
        );
      }
      pickedFiles.removeWhere((file) => file.path.endsWith('.gif'));

      return pickedFiles;
    } catch (e) {
      return null;
    }
  }

  static Future<XFile?> pickImageFromLibrary({
    required BuildContext context,
    double? width,
    double? height,
  }) async {
    try {
      final hasPermission = await AppPermissionUtils.hasStoragePermission(context);
      if (!hasPermission) {
        return null;
      }
      final pickedFiles = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: maxWidthResolution,
        maxHeight: maxHeightResolution,
      );
      if (pickedFiles == null) {
        return null;
      }
      final bool hasGifImage = pickedFiles.path.endsWith('.gif');
      if (hasGifImage) {
        ToastUtils.showErrorToast(
          context,
          message: R.strings.image_picked_invalid,
        );
        return null;
      }
      return pickedFiles;
    } catch (e) {
      return null;
    }
  }

  static Future<XFile?> pickFromCamera({
    required BuildContext context,
    double? width,
    double? height,
  }) async {
    try {
      final hasPermission = await AppPermissionUtils.hasCameraPermission(context);
      if (!hasPermission) {
        return null;
      }
      final pickedFiles = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: maxWidthResolution,
        maxHeight: maxHeightResolution,
      );
      if (pickedFiles == null) {
        return null;
      }
      final bool hasGifImage = pickedFiles.path.endsWith('.gif');
      if (hasGifImage) {
        ToastUtils.showErrorToast(
          context,
          message: R.strings.image_picked_invalid,
        );
        return null;
      }
      return pickedFiles;
    } catch (e) {
      return null;
    }
  }
}
