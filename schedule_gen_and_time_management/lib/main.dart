import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // ✅ Import đúng thư viện
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Đảm bảo Flutter đã khởi tạo
  await initializeDateFormatting('en', null); // ✅ Khởi tạo dữ liệu định dạng ngày tháng

  Intl.defaultLocale = 'en'; // ✅ Thiết lập ngôn ngữ mặc định

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DateScroller(),
    );
  }
}

class DateScroller extends StatelessWidget {
  final DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker Scroller"),
      ),
      body: Container(
        width: double.infinity,
        height: 60,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, pageIndex) {
            // ✅ Tính ngày bắt đầu cho mỗi trang (7 ngày một trang)
            DateTime startDate = today.add(Duration(days: pageIndex * 7));
        
            return ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) { // ✅ Sửa lỗi trùng tên biến
                DateTime currentDate = startDate.add(Duration(days: index));
                return Container( padding: EdgeInsets.symmetric(horizontal: 6) , child: _itemday(currentDate));
              },
            );
          },
        ),
      ),
    );
  }
}

Widget _itemday(DateTime date) {
  String defaultLanguage = DateFormat('EEE', Intl.defaultLocale).format(date); // ✅ Sử dụng Intl.defaultLocale đúng cách

  return Container(
    width: 45,
    height: 50,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), color: R.color.colorButtonSearch),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          date.today, // ✅ Hiển thị ngày
          style: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.E4F54),
        ),
        Text(
          defaultLanguage, // ✅ Hiển thị thứ trong tuần
          style: R.textStyle.inter_medium_10_500.copyWith(color: R.color.A8A8E),
        )
      ],
    ),
  );
}
