import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  /// Chuyển đổi Color thành chuỗi HEX không có dấu #
  String toHex({bool withAlpha = false}) {
    return withAlpha
        ? "${a.toInt().toRadixString(16).padLeft(2, '0')}"  // Alpha
          "${r.toInt().toRadixString(16).padLeft(2, '0')}"  // Red
          "${g.toInt().toRadixString(16).padLeft(2, '0')}"  // Green
          "${b.toInt().toRadixString(16).padLeft(2, '0')}"  // Blue
          .toUpperCase()
        : "${r.toInt().toRadixString(16).padLeft(2, '0')}"
          "${g.toInt().toRadixString(16).padLeft(2, '0')}"
          "${b.toInt().toRadixString(16).padLeft(2, '0')}"
          .toUpperCase();
  }
}

extension ColorExtension on String {
  Color toColor() {
    String hexColor = toUpperCase().replaceAll("#", ""); // Sử dụng this

    if (hexColor.length == 6) {
      hexColor = "FF$hexColor"; // Thêm alpha mặc định (FF)
    } else if (hexColor.length != 8) {
      throw ArgumentError("Mã màu không hợp lệ: $this"); // Sử dụng this trong lỗi
    }

    return Color(int.parse("0x$hexColor")); // Chuyển thành Color
  }
}