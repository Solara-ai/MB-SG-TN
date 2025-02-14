// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:schedule_gen_and_time_management/src/utils/extensions/build_context_extension.dart';
// import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';

// abstract class BasePage extends StatefulWidget {
//   const BasePage({super.key});
// }

// abstract class _BasePageState<P extends BasePage> extends State<P> with WidgetsBindingObserver {
//   bool _isShowPageLoading = false;
//   @override
//   void initState() {
//     WidgetsBinding.instance.addObserver(this);
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       onCreated();
//       onResume();
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _cancelAllSubs();
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//     if (state == AppLifecycleState.resumed) {
//       onResume();
//     } else if (state == AppLifecycleState.inactive) {
//       onPause();
//     }
//   }

//   void onCreated() {}

//   void onResume() {}

//   void onPause() {}

//   ///***************************************************************************
//   /// SUBSCRIPTIONS
//   ///***************************************************************************

//   final List<StreamSubscription> _subscriptions = [];

//   void cancelSubOnDispose(StreamSubscription sub) {
//     _subscriptions.add(sub);
//   }

//   void _cancelAllSubs() {
//     for (final sub in _subscriptions) {
//       sub.cancel();
//     }
//     _subscriptions.clear();
//   }

//   ///***************************************************************************
//   /// LOADING
//   ///***************************************************************************

//   Future<T?> showLoadingDialog<T>() {
//     _isShowPageLoading = true;
//     return pushDialog(const LoadingWidget());
//   }

//   void hideLoadingDialog() {
//     if (_isShowPageLoading) {
//       _isShowPageLoading = false;
//       popPage();
//     }
//   }

//   ///***************************************************************************
//   /// NAVIGATOR
//   ///***************************************************************************

//   Future<T?> pushPage<T>(BasePage screen, {Object? arguments}) {
//     return context.pushScreen(screen, arguments: arguments, onPause: onPause, onResume: onResume);
//   }

//   Future<T?> replacePage<T>(BasePage screen, {Object? arguments}) {
//     return context.replaceScreen(screen, arguments: arguments);
//   }

//   Future<T?> popToFirstAndPushScreen<T>(BasePage screen, {Object? arguments}) {
//     return context.popToFirstAndPushScreen(screen, arguments: arguments);
//   }

//   Future<T?> popToFirstAndReplaceScreen<T>(BasePage screen, {Object? arguments}) {
//     return context.popToFirstAndReplaceScreen(screen, arguments: arguments);
//   }

//   void popPage({Object? result}) {
//     context.popScreen(result: result);
//   }

//   void popPages(int pop) {
//     context.popMultiScreen(pop);
//   }

//   void popUntilPage(Type screen) {
//     context.popUntilScreen(screen);
//   }

//   void popToFirstScreen() {
//     context.popToFirstScreen();
//   }

//   Future<T?> pushDialog<T>(
//     Widget dialog, {
//     bool barrierDismissible = true,
//     Color? barrierColor = Colors.black54,
//     String? barrierLabel,
//     bool useSafeArea = true,
//     bool useRootNavigator = true,
//     RouteSettings? routeSettings,
//     Offset? anchorPoint,
//   }) {
//     return NavigatorUltils.pushDialog(
//       context,
//       dialog: dialog,
//       barrierColor: barrierColor,
//       barrierDismissible: barrierDismissible,
//       useSafeArea: useSafeArea,
//       useRootNavigator: useRootNavigator,
//       routeSettings: routeSettings,
//       anchorPoint: anchorPoint,
//     );
//   }

//   Future<T?> pushBottomSheet<T>({
//     required Widget bottomSheet,
//     Color? backgroundColor,
//     double? elevation,
//     ShapeBorder? shape,
//     BoxConstraints? constraints,
//     Color? barrierColor,
//     bool isScrollControlled = false,
//     bool useRootNavigator = false,
//     bool isDismissible = true,
//     bool enableDrag = true,
//     bool useSafeArea = false,
//     Clip? clipBehavior,
//   }) {
//     return NavigatorUltils.pushBottomSheet<T>(
//       context,
//       bottomSheet: bottomSheet,
//       isScrollControlled: isScrollControlled,
//       backgroundColor: backgroundColor,
//       elevation: elevation,
//       clipBehavior: clipBehavior,
//       constraints: constraints,
//       isDismissible: isDismissible,
//       enableDrag: enableDrag,
//       useSafeArea: useSafeArea,
//       shape: shape,
//     );
//   }
// }