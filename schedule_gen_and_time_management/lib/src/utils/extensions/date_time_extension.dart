// import 'package:flutter/material.dart';




import 'package:intl/intl.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/res/strings.dart';

extension DateTimeExtension on DateTime {
  String get timeDescription {
    if (this.hour >= 0 && this.hour < 12) {
      return R.strings.good_morning;
    } else if (this.hour >= 12 && this.hour < 18) {
      return R.strings.good_afternoon;
    } else {
      return R.strings.good_evening;
    }
  }
}

extension DateTimeExt on DateTime {
  
  // String get languageCode => Localizations.DEFAULT_LANGUAGE.code;
  // trả về chuỗi định dạng giờ của đối tượng 
  String get toHM => DateFormat('Hm').format(this);
  // trả về chuỗi định dạng tháng , ngày , năm 
  String get toMdY =>DateFormat('dd/MM/yyyy').format(this);

  String get today => DateFormat('dd').format(this);
}

//   String toRelativeTime() {
//     final currentDate = DateTime.now();
//     hàm difference được sử dụng để tính toans sự chênh lệch giữa 2 đối tượng . 
//     final diff = currentDate.difference(this);
//     if (diff.inMinutes == 0) {
//       return R.string.time_just_now;
//     }
//     if (diff.inHours < 1) {
//       return R.string.time_minutes_ago(plural: diff.inMinutes);
//     }
//     if (diff.inHours < 24) {
//       return R.string.time_hour_ago(plural: diff.inHours);
//     }
//     if (diff.inDays <= 7) {
//       return R.string.time_day_ago(plural: diff.inDays);
//     }

//     return DateFormat(DateFormatType.hhMMSpaceDDCommaYYYY.pattern).format(this);
//   }

//   static int calculateRemainingDays(String endDate) {
//     if (endDate.isEmpty) return 0;
//     final DateTime endDateTime = DateTime.parse(endDate);
//     final DateTime currentDate = DateTime.now();
//     final Duration difference = endDateTime.difference(currentDate);
//     return difference.inDays;
//   }

//   static String convertToString({required String dateString, required DateFormatType dateFormatType}) {
//     final DateTime dateTime = DateTime.parse(dateString).toLocal();
//     final String formattedDate = DateFormat(dateFormatType.pattern).format(dateTime);
//     return formattedDate;
//   }

//   static String convertTimestampToString({required int timestamp, required DateFormatType dateFormatType}) {
//     final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
//     final String formattedDate = DateFormat(dateFormatType.pattern).format(dateTime);
//     return formattedDate;
//   }

//   String formatToString(String dateFormatType) {
//     final String formattedDate = DateFormat(dateFormatType).format(this.toLocal());
//     return formattedDate;
//   }

//   static String millisecondsToTimeString(int milliseconds) {
//     final Duration duration = Duration(milliseconds: milliseconds);

//     String twoDigits(int n) => n.toTwoDigitString;

//     final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
//     final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

//     return '$twoDigitMinutes:$twoDigitSeconds';
//   }
// }