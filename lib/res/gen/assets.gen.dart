/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  /// Directory path: lib/res
  $LibResGen get res => const $LibResGen();
}

class $LibResGen {
  const $LibResGen();

  /// Directory path: lib/res/drawables
  $LibResDrawablesGen get drawables => const $LibResDrawablesGen();
}

class $LibResDrawablesGen {
  const $LibResDrawablesGen();

  /// File path: lib/res/drawables/ic_add.svg
  String get icAdd => 'lib/res/drawables/ic_add.svg';

  /// File path: lib/res/drawables/ic_add_epic.svg
  String get icAddEpic => 'lib/res/drawables/ic_add_epic.svg';

  /// File path: lib/res/drawables/ic_add_plan.svg
  String get icAddPlan => 'lib/res/drawables/ic_add_plan.svg';

  /// File path: lib/res/drawables/ic_add_task.svg
  String get icAddTask => 'lib/res/drawables/ic_add_task.svg';

  /// File path: lib/res/drawables/ic_ai.svg
  String get icAi => 'lib/res/drawables/ic_ai.svg';

  /// File path: lib/res/drawables/ic_arrow_down_more.svg
  String get icArrowDownMore => 'lib/res/drawables/ic_arrow_down_more.svg';

  /// File path: lib/res/drawables/ic_arrow_left.svg
  String get icArrowLeft => 'lib/res/drawables/ic_arrow_left.svg';

  /// File path: lib/res/drawables/ic_close.svg
  String get icClose => 'lib/res/drawables/ic_close.svg';

  /// File path: lib/res/drawables/ic_empty_img_simple.svg
  String get icEmptyImgSimple => 'lib/res/drawables/ic_empty_img_simple.svg';

  /// File path: lib/res/drawables/ic_goal_complete.svg
  String get icGoalComplete => 'lib/res/drawables/ic_goal_complete.svg';

  /// File path: lib/res/drawables/ic_home.svg
  String get icHome => 'lib/res/drawables/ic_home.svg';

  /// File path: lib/res/drawables/ic_logout.svg
  String get icLogout => 'lib/res/drawables/ic_logout.svg';

  /// File path: lib/res/drawables/ic_plan.svg
  String get icPlan => 'lib/res/drawables/ic_plan.svg';

  /// File path: lib/res/drawables/ic_schedule.svg
  String get icSchedule => 'lib/res/drawables/ic_schedule.svg';

  /// File path: lib/res/drawables/ic_settings.svg
  String get icSettings => 'lib/res/drawables/ic_settings.svg';

  /// File path: lib/res/drawables/ic_study.svg
  String get icStudy => 'lib/res/drawables/ic_study.svg';

  /// File path: lib/res/drawables/ic_success.svg
  String get icSuccess => 'lib/res/drawables/ic_success.svg';

  /// File path: lib/res/drawables/ic_task_complete.svg
  String get icTaskComplete => 'lib/res/drawables/ic_task_complete.svg';

  /// File path: lib/res/drawables/ic_task_manage.svg
  String get icTaskManage => 'lib/res/drawables/ic_task_manage.svg';

  /// File path: lib/res/drawables/ic_work.svg
  String get icWork => 'lib/res/drawables/ic_work.svg';

  /// File path: lib/res/drawables/img_evening.png
  AssetGenImage get imgEvening =>
      const AssetGenImage('lib/res/drawables/img_evening.png');

  /// File path: lib/res/drawables/img_logo_app.png
  AssetGenImage get imgLogoApp =>
      const AssetGenImage('lib/res/drawables/img_logo_app.png');

  /// File path: lib/res/drawables/img_logo_login.png
  AssetGenImage get imgLogoLogin =>
      const AssetGenImage('lib/res/drawables/img_logo_login.png');

  /// File path: lib/res/drawables/img_sun_clound.png
  AssetGenImage get imgSunClound =>
      const AssetGenImage('lib/res/drawables/img_sun_clound.png');

  /// File path: lib/res/drawables/img_task.png
  AssetGenImage get imgTask =>
      const AssetGenImage('lib/res/drawables/img_task.png');

  /// List of all assets
  List<dynamic> get values => [
        icAdd,
        icAddEpic,
        icAddPlan,
        icAddTask,
        icAi,
        icArrowDownMore,
        icArrowLeft,
        icClose,
        icEmptyImgSimple,
        icGoalComplete,
        icHome,
        icLogout,
        icPlan,
        icSchedule,
        icSettings,
        icStudy,
        icSuccess,
        icTaskComplete,
        icTaskManage,
        icWork,
        imgEvening,
        imgLogoApp,
        imgLogoLogin,
        imgSunClound,
        imgTask
      ];
}

class Assets {
  Assets._();

  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
