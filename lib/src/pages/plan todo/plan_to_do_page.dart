import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';
import 'package:schedule_gen_and_time_management/src/widgets/custom_appbar.dart';

class PlanToDoPage extends BasePage {
  @override
  _PlanTodoPageState createState() => _PlanTodoPageState();
}

class _PlanTodoPageState extends BaseState<PlanToDoPage> {
  DateTime dtNow = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.white,
      appBar: appBar(R.strings.plan_to_do),
      body: _buildBody(),
    );
  }

  Widget _buildBody () {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
        child: Column(
          children: [
            _buildHeader(),

          ],
        ),
    );
  }

  Widget _buildHeader() {
    return Wrap(
      spacing: 12, // Khoảng cách giữa các item
      children: List.generate(7, (index) {
        final date = dtNow.add(Duration(days: index - 3));
        return date.day == dtNow.day ? _buildItemToday(date) : _buildItemDayDefault(date);
      }),
    );
  }

  Widget _buildItemToday(DateTime date) {
    return _itemdayDecoration(
      89,
      71,
      R.color.itemToday,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date.dayNumber,
            style: R.textStyle.inter_semibold_24_600.copyWith(color: R.color.white),
          ),
          Text(
            date.dayText,
            style: R.textStyle.inter_semibold_16_600.copyWith(color: R.color.white),
          ),
        ],
      ),
    );
  }

  Widget _itemdayDecoration(double height, double width, Color color, Widget child,
      {EdgeInsetsGeometry? margin}) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: child,
    );
  }

  Widget _buildItemDayDefault(DateTime date) {
    return _itemdayDecoration(
        50,
        41,
        R.color.F2F2F2,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.dayNumber,
              style: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.E4F54),
            ),
            Text(
              date.dayText,
              style: R.textStyle.inter_medium_10_500.copyWith(color: R.color.A8A8E),
            ),
          ],
        ),
        margin: EdgeInsets.only(top: 37));
  }
}
