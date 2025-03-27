import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/main/base_scaffold_page.dart';
import 'package:schedule_gen_and_time_management/src/widgets/action_icon_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/action_appbar.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends BasePage {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends BaseState<SchedulePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusday = DateTime.now();
  late DateTime _slectedDate;

  @override
  void initState() {
    _slectedDate = _focusday;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldPage(
        appbar: actionAppbar(
          title: R.strings.schedule,
          backGroundColor: R.color.white,
          action: [
            ActionIconAppbar(
              iconAsset: R.drawables.ic_noti,
              color: R.color.black,
            )
          ],
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Column();
  }

  Widget _buildItemEvent() {
    return GestureDetector(
      onTap: () {
        //TODO bottomshow
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 96),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: R.color.item_event,
            border: Border.all(color: R.color.item_event),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buidColorItemEvent(R.color.colorSuccessBase),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      '10:00-13:00',
                      style: R.textStyle.inter_regular_12_400.copyWith(color: R.color.timeEvent),
                    ),
                  ), // ở đây có thể để ($startTime - $endTime)
                  GestureDetector(
                    onTap: () {
                      // TODO delete
                    },
                    behavior: HitTestBehavior.opaque,
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: Text(R.strings.deleted,
                          style: R.textStyle.inter_regular_12_400.copyWith(
                              color: R.color.textStatusDone, decoration: TextDecoration.underline)),
                    ),
                  )
                ],
              ),
              SizedBox(height: 14,),
              // Name event
              Text(
                'Design new UX Flow',
                style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.text),
              ),
              // Description event
              Text('Start from screen 16' , style: R.textStyle.inter_regular_10_400,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buidColorItemEvent(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration:
          BoxDecoration(color: R.color.item_event, border: Border.all(width: 5, color: color)),
    );
  }
}
