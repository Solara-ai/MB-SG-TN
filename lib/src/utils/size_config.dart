import 'package:flutter/cupertino.dart';

class SizeConfig {
  SizeConfig._();
  static Size screenSize = const Size(0, 0);
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;
  static double _safeAreaHorizontal = 0;
  static double _safeAreaVertical = 0;
  static double safeBlockHorizontal = 0;
  static double safeBlockVertical = 0;
  static double bottomPadding = 0;
  static double devicePixelRatio = 0;

  static double get plaformBottomPadding => bottomPadding > 0 ? 0 : 16;

  static void init(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    screenSize = mediaQueryData.size;
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal = mediaQueryData.padding.left + mediaQueryData.padding.right;
    _safeAreaVertical = mediaQueryData.padding.top + mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    bottomPadding = mediaQueryData.padding.bottom;
    devicePixelRatio = mediaQueryData.devicePixelRatio;
  }
}
