// import 'package:flutter/material.dart';




import 'package:intl/intl.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
enum DateFormatType {
  ddMM('dd/MM'),
  ddMMyyyy('dd/MM/yyyy'),
  ddSpaceMMMSpaceyyyy('dd MMM yyyy'),
  yyyyMMdd('yyyy/MM/dd'),
  ddDashYYDashyyyy('dd-MM-yyyy'),
  yyyyDashMMDashdd('yyyy-MM-dd'),
  EEEEMMMMddyyyy ('EEEE MMMM dd yyyy '),
  ddMMyyyyAthhmma('dd/MM/yyyy \'at\' hh:mm a'),
  MMMSpacedd('MMM dd'),
  MMMSpaceDDCommaYYYY('MMM dd, yyyy'),
  MMMSpaceDDSpaceYYYY('MMM dd yyyy'),
  MMMddhhmmaaa('MMM dd - hh:mm aaa'),
  hhMMSpaceDDCommaYYYY('hh:mm aaa, MMM dd, yyyy'),
  hhMMSpaceDDSpaceYYYY('hh:mm aaa MMM dd yyyy'),
  MMMddCommayyyyAthhmma('MMM dd, yyyy \'at\' hh:mm a'),
  hhmmaaa('hh:mm aaa'),
  hhmm('HH:mm'),
  dddSpaceMMMSpaceDDSpaceyyyySpacehhmmss('EEE MMM dd yyyy HH:mm:ss'),
  HHmmCommaMMMSpaceddSpaceYYYY('HH:mm, MMM dd yyyy');

  final String pattern;

  const DateFormatType(this.pattern);
}




extension DateTimeExtension on DateTime {
  String get timeDescription {
    if (hour >= 0 && hour < 12) {
      return R.strings.good_morning;
    } else if (hour >= 12 && hour < 18) {
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

  String get dayNumber => DateFormat('dd').format(this);

  String get dayText =>  DateFormat ('EEE').format(this);

  String get 
  toMdYtext => DateFormat(DateFormatType.EEEEMMMMddyyyy.pattern).format(this);

  static String convertToString({required String dateString, required DateFormatType dateFormatType}) {
  final DateTime dateTime = DateTime.parse(dateString).toLocal();
  final String formattedDate = DateFormat(dateFormatType.pattern).format(dateTime);
  return formattedDate;
  }

  String formatToString(String dateFormatType) {
  final String formattedDate = DateFormat(dateFormatType).format(toLocal());
  return formattedDate;
  }

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