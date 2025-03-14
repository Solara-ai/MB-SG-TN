import 'package:flutter/material.dart';

class NavigatorUltils {
  NavigatorUltils._();

  static bool isDialogOpen = false;

  static Future pushAndRemoveUntilPage(BuildContext context, Widget widget) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
  }

  static Future pushAndRemoveUntilKeepFirstPage(BuildContext context, Widget widget) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget), ModalRoute.withName(Navigator.defaultRouteName));
  }

  static void popToFirst(BuildContext context) {
    return Navigator.of(context).popUntil((Route<dynamic> route) => route.isFirst);
  }

  static void popByTime(BuildContext context, int count, {dynamic result}) {
    for (int i = 0; i < count - 1; i++) {
      Navigator.of(context).pop();
    }

    Navigator.of(context).pop(result);
  }

  static void popUntil(BuildContext context) {
    return Navigator.of(context).popUntil((Route<dynamic> route) => false);
  }

  static void popDialog(BuildContext context) {
    return Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  static Future<T?> navigatePage<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(MaterialPageRoute(builder: (context) => widget));
  }

  static Future rootNavigatePage(BuildContext context, Widget widget) {
    return Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => widget));
  }

  static void safePop<T extends Object?>(BuildContext context, [T? result]) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop<T>(result);
    }
  }

  static Future<T?> pushDialog<T>(
    BuildContext context, {
    required Widget dialog,
    bool barrierDismissible = true,
    // barrierDismissible : được sử dụng để cho phép người dùng có thể tắt hộp thoại khi nhấn ra các vùng khác bên ngoài hộp thoại hay không 
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    bool preventDuplicate = true,
    // preventDuplicate được sử dụng để ngăn chặn việc mở nhiều hộp thoại 1 lúc , true nếu hộp thoại đã mở ngăn chặn không cho mở thêm hộp thoại nữa , false sẽ cho phép chồng nhiều hộp thoại lên nhau 
  }) async {
    if (preventDuplicate) {
      if (isDialogOpen) return null;
      isDialogOpen = true;
    }
    return showDialog<T>(
      context: context,
      builder: (context) => dialog,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useRootNavigator: useRootNavigator,
      useSafeArea: useSafeArea,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
    ).whenComplete(() {
      isDialogOpen = false;
    });
  }

  static Future<T?> pushBottomSheet<T>(
    BuildContext context, {
    required Widget bottomSheet,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool useSafeArea = false,
    Clip? clipBehavior,
  }) {
    return showModalBottomSheet<T>(
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      elevation: elevation,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      constraints: constraints,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      useSafeArea: useSafeArea,
      shape: shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
      context: context,
      builder: (context) => bottomSheet,
    );
  }
}