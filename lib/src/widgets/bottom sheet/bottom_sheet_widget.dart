
import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/size_config.dart';
import 'package:schedule_gen_and_time_management/src/widgets/bottom%20sheet/actions_sheet_item.dart';
import 'package:schedule_gen_and_time_management/src/widgets/image_picker.dart';

class BottomSheetUtil {
  BottomSheetUtil._();

  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    Widget? modalTitle,
    Widget? trailing,
    double? radius,
    double? maxHeight,
    Color? backgroundColor,
    VoidCallback? whenComplete,
    bool isDismissible = true,
    bool wrapContent = false,
  }) async {
    return showModalBottomSheet<T?>(
      context: context,
      isScrollControlled: !wrapContent,
      useRootNavigator: true,
      useSafeArea: true,
      isDismissible: isDismissible,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radius ?? R.dimen.xs_8),
          topLeft: Radius.circular(radius ?? R.dimen.xs_8),
        ),
      ),
      constraints: BoxConstraints(
        minHeight: SizeConfig.screenHeight * 0.1,
        maxHeight: maxHeight ?? SizeConfig.screenHeight * 0.9,
      ),
      backgroundColor: backgroundColor ?? R.color.white,
      builder: (builder) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildHeaderNotch(modalTitle),
            if (wrapContent) child else Expanded(child: child),
          ],
        );
      },
    ).whenComplete(() {
      whenComplete?.call();
    });
  }

  static Widget _buildHeaderNotch(Widget? modalTitle) {
    return Column(
      children: [
        Align(
          child: Container(
            width: SizeConfig.screenWidth / 5,
            height: R.dimen.xxs_4,
            margin: EdgeInsets.symmetric(
              vertical: R.dimen.xs_8,
            ),
            decoration: BoxDecoration(
              color: R.color.placeholder,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        modalTitle ?? const SizedBox()
      ],
    );
  }

  static Future<String?> buildActionSheet(BuildContext context, List<ActionSheet> items) {
    return showModalBottomSheet<String?>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(color: R.color.white, borderRadius: BorderRadius.circular(16)),
          child: ListView(
            primary: false,
            shrinkWrap: true,
            children: [
              Container(
                height: 5,
                margin: const EdgeInsets.fromLTRB(137.5, 12, 137.5, 8),
                decoration: BoxDecoration(
                  color: R.color.colorFillContent,
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
              ...items.map((item) => ActionSheetItem(item: item)),
            ],
          ),
        );
      },
    );
  }

  static Future<XFile?> buildImagePickerSheet(BuildContext context) async {
    const cameraValue = 'camera';
    const galleryValue = 'gallery';
    final result = await buildActionSheet(
      context,
      [
        ActionSheet(
            value: cameraValue, displayValue: R.strings.choose_from_camera, assetName: R.drawables.ic_choose_image),
        ActionSheet(
            value: galleryValue, displayValue: R.strings.choose_from_library, assetName: R.drawables.ic_choose_image),
      ],
    );
    if (result == cameraValue) {
      await CustomImagePicker.pickFromCamera(context: context);
    } else if (result == galleryValue) {
      return CustomImagePicker.pickImageFromLibrary(context: context);
    }
    return Future.value(null);
  }

  // static Future<XFile?> buildFilePickerSheet(BuildContext context) async {
  //   const galleryValue = 'gallery';
  //   const filesValue = 'files';
  //   final result = await buildActionSheet(
  //     context,
  //     [
  //       ActionSheet(
  //           value: galleryValue, displayValue: R.string.choose_from_gallery, assetName: R.drawable.ic_choose_image),
  //     ],
  //   );
  //   if (result == galleryValue) {
  //     return CustomImagePicker.pickImageFromLibrary(context: context);
  //   } else if (result == filesValue) {
  //     return _pickFile();
  //   }
  //   return null;
  // }

  // static Future<XFile?> _pickFile() async {
  //   final FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: [
  //       FileExtension.png.pattern,
  //       FileExtension.jpeg.pattern,
  //       FileExtension.jpg.pattern,
  //     ],
  //   );

  //   if (result != null) {
  //     final PlatformFile file = result.files.first;
  //     return file.xFile;
  //   }
  //   return null;
  // }
}
