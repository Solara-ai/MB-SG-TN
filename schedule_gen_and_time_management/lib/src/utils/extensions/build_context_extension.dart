import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* hàm được sử dụng để tạo ra 1 route dựa vào nền tảng platForm , cụ thể ở đây là android và ios
hàm sẽ được sử dụng để tạo ra các hành vi route phù hợp với nền tảng android hoặc ios và route được nhắc đến 
đó chính là các hành vi liên quan đến Navigator .
 */
PageRoute<T> PlatformPageRoute<T>({
  required Widget Function(BuildContext) builder,
  // đối với thuộc tính với kiểu dữ liệu RouteSettings tác dụng của nó đó chính là được sử dụng để thiết lập một cách rõ ràng các router , ngoài ra cũng có thể dễ dàng truyền và nhận dữ liệu giữa các route 
  RouteSettings? settings,
  // đối với thuộc tính maintainState là true , có nghĩa là vẫn sẽ giữ lại các trạng thái ban đầu của 1 router trong stack khi có màn hình khác được push lên scerren cũ trong stack .
  bool maintainState = true,
  // đối với thuộc tính fullscreenDialog , khi tham số này được đặt là true , sẽ có một số khác biệt giữa 2 nên tảng , đối với ios thì Sẽ xuất hiện với kiểu giao diện Cupertino đặc trưng của dialog, có thể bao gồm nút "Close" thay vì nút "Back" , nhưng đối với hệ điều hành android thì  việc sử dụng fullscreenDialog có thể giúp tuân thủ phong cách hiển thị tương tự khi cần , đối với việc đặt fullscerrenDialog là false , ,àn hình mới được đẩy lên sẽ không được hiển thị như một dialog. Thay vào đó, nó sẽ được xem như một màn hình thông thường và có nút "Back" trong AppBar hoặc các hành động khác để quay về màn hình trước.
  bool fullscreenDialog = false,
  // allowSnapshotting nếu được đặt là true thì nó sẽ được sử dụng để  giúp ứng dụng chụp ảnh nhanh giao diện người dùng cho các mục đích như hiển thị trong danh sách ứng dụng gần đây hoặc tạo hiệu ứng chuyển đổi giao diện.
  bool allowSnapshotting = true,
}) {
  return Platform.isIOS
      ? CupertinoPageRoute<T>(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
        )
      : MaterialPageRoute<T>(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
        );
}

/* tại đây extension với các hàm bên dưới sẽ được sử dụng cho kiểu dữ liệu đó chính là BuildContext , và khi thực hiện chúng ta chỉ việc
sử dụng đó chính là context.pushScreen , lí do chúng ta thực hiện nó là một kiểu dữ liệu Future là dùng để khi push 1 scerren lên stack hiện tại và sau khi pop nó đi chúng ta sẽ nhận lại một kiểu dữ liệu kiểu T . 
*/
extension ContextNavigation on BuildContext {
  Future<T?> pushScreen<T>(
    Widget screen, {
    // arguments được sử dụng để thực hiện việc truyền dữ liệu trước khi push một màn hình mới vào và dữ liệu này sẽ có dạng đó chính là key value. 
    Object? arguments,
    VoidCallback? onPause,
    // đối với hàm callBack onpause sẽ được thực hiện như sau 
    VoidCallback? onResume,
  }) {
    return Navigator.push<T>(
      this,
      PlatformPageRoute<T>(
        settings: RouteSettings(name: screen.runtimeType.toString(), arguments: arguments),
        builder: (context) {
          onPause?.call();
          return screen;
        },
      ),
    ).then((value) {
      //then được sử dụng để xử lý kết quả của Future khi nó hoàn thành thành công. Phương thức này nhận vào một hàm callback và hàm này sẽ được thực thi với giá trị mà Future trả về.
      return value;
    }).whenComplete(() {
      //.whenComplete được sử dụng để thực hiện một hành động sau khi Future hoàn thành, bất kể kết quả là thành công hay thất bại. Đây là nơi có thể đặt mã cần chạy sau khi Future hoàn thành mà không quan tâm đến giá trị trả về hoặc lỗi.
      onResume?.call();
    });
  }
  // phương thức push and replaceScreen được sử dụng để push một trang mới vào ngăn xếp stack và loại bỏ trang cũ . 
  Future<T?> replaceScreen<T>(Widget screen, {Object? arguments}) {
    return Navigator.pushReplacement(
      this,
      //được sử dụng để điều hướng giữa các trang (screens) theo phong cách iOS.
      CupertinoPageRoute(
          settings: RouteSettings(
            name: screen.runtimeType.toString(),
            arguments: arguments,
          ),
          builder: (context) {
            return screen;
          }),
    );
  }
  
  void popScreen({Object? result}) {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop(result);
    }
  }

  void popMultiScreen(int pop) {
    for (int i = 0; i < pop; i++) {
      popScreen();
    }
  }

  void popUntilScreen(Type screen) {
    Navigator.popUntil(this, (route) => route.settings.name == screen.toString() || route.isFirst);
  }

  void popToFirstScreen() {
    Navigator.popUntil(this, (route) => route.isFirst);
  }

  Future<T?> popToFirstAndPushScreen<T>(Widget screen, {Object? arguments}) {
    Navigator.popUntil(this, (route) => route.isFirst);
    return pushScreen(screen, arguments: arguments);
  }

  Future<T?> popToFirstAndReplaceScreen<T>(Widget screen, {Object? arguments}) {
    Navigator.popUntil(this, (route) => route.isFirst);
    return replaceScreen(screen, arguments: arguments);
  }

  List<T> findAllDescendantWidgetsOfExactType<T>() {
    final List<T> widgets = [];

    void visitElement(Element element) {
      if (element.widget is T) {
        widgets.add(element.widget as T);
      }
      element.visitChildren(visitElement);
    }

    visitChildElements(visitElement);
    return widgets;
  }
}