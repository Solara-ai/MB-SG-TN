import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/gen/assets.gen.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/chat_bot/chat_bot_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/main/base_scaffold_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/action_icon_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/action_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/header_decoration.dart';

class HomePage extends BasePage {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  late DateTime dtNow;

  @override
  void initState() {
    dtNow = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldPage(
        appbar: actionAppbar(
          colorIcon: R.color.white,
          backGroundColor: R.color.app_color,
          title: R.strings.home,
          textStyle: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.white),
          action: [
            ActionIconAppbar(
              iconAsset: Assets.lib.res.drawables.icNoti,
              iconColor: R.color.white,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: R.color.app_color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)), 
                ),
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: SvgPicture.asset(Assets.lib.res.drawables.icAi),
                      title: Text(R.strings.chat_ai , style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.white),),
                      onTap: () {
                        NavigatorUltils.navigatePage(context, ChatBotPage());
                      },
                    ),
                  );
                },
              );
            },
            backgroundColor: R.color.app_color,
            shape: CircleBorder(),
            child: SvgPicture.asset(
              Assets.lib.res.drawables.icAdd,
              width: 30,
              height: 30,
            )),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerDecoration(withd: double.infinity, heigt: 160, child: _buildHeader()),
        SizedBox(
          height: 30,
        ),
        _buildMainPage(name: 'Lam Phuc', dateTimeNow: dtNow)
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dtNow.toMdYtext,
            style: R.textStyle.inter_semibold_16_600.copyWith(color: R.color.white),
          ),
          SizedBox(height: 25),
          Wrap(
            spacing: 12, // Khoảng cách giữa các item
            children: List.generate(7, (index) {
              final date = dtNow.add(Duration(days: index - 3));
              return date.day == dtNow.day ? _buildItemToday(date) : _buildItemDayDefault(date);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildMainPage({required String name, required DateTime dateTimeNow}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dateTimeNow.timeDescription + name,
              style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.app_color)),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _itemMainPage(
                    title: R.strings.task_incomplete,
                    pathIcon: Assets.lib.res.drawables.icTaskComplete,
                    totalCompleteOfTitle: '0',
                    color: R.color.app_color),
                _itemMainPage(
                    title: R.strings.goal_incomplete,
                    pathIcon: Assets.lib.res.drawables.icGoalComplete,
                    totalCompleteOfTitle: '0',
                    color: R.color.backGroundGoalComplete),
              ],
            ),
          ),
          Container(
              height: 1.8,
              margin: EdgeInsets.only(top: 32),
              width: double.infinity,
              color: R.color.app_color),
          SizedBox(height: 14),
          Text(R.strings.schedule,
              style: R.textStyle.inter_semibold_24_600.copyWith(color: R.color.app_color)),
          SizedBox(height: 5),
          Text(
            R.strings.next_event,
            style: R.textStyle.inter_medium_14_500.copyWith(color: R.color.D3BDFF),
          ),
          _itemNextEvent(
              eventName: 'code flutter',
              eventDescription: 'Study flutter',
              startTime: dateTimeNow.toHM,
              endTime: dateTimeNow.toHM)
        ],
      ),
    );
  }

  Widget _buildItemDayDefault(DateTime date) {
    return _itemdayDecoration(
        50,
        41,
        R.color.white,
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

  Widget _itemMainPage(
      {required String title,
      required String pathIcon,
      required String totalCompleteOfTitle,
      required Color color}) {
    return Container(
      width: 160,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: R.textStyle.inter_light_16_300.copyWith(color: R.color.white),
                ),
              ),
              Container(margin: EdgeInsets.only(top: 5), child: SvgPicture.asset(pathIcon)),
            ],
          ),
          SizedBox(height: 10),
          Text(
            totalCompleteOfTitle,
            style: R.textStyle.inter_semibold_35_600.copyWith(color: R.color.white),
          ),
        ],
      ),
    );
  }

  Widget _itemNextEvent(
      {required String eventName,
      required String eventDescription,
      required String startTime,
      required String endTime}) {
    return Container(
      height: 109,
      margin: EdgeInsets.only(top: 13),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: R.color.F9F5FF,
          border: Border(
            top: BorderSide(color: R.color.app_color),
            left: BorderSide(width: 10, color: R.color.app_color),
            right: BorderSide(color: R.color.app_color),
            bottom: BorderSide(color: R.color.app_color),
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(eventName,
                        style: R.textStyle.inter_bold_16_700.copyWith(color: R.color.app_color)),
                    SizedBox(height: 5),
                    Text(eventDescription,
                        style: R.textStyle.inter_medium_12_500.copyWith(color: R.color.D3BDFF)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                    color: R.color.app_color,
                    border: Border.all(color: R.color.app_color),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  R.strings.timeStart_timeEnd(startTime, endTime),
                  style: R.textStyle.inter_medium_10_500.copyWith(color: R.color.white),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            color: R.color.app_color,
            height: 1,
          )
        ],
      ),
    );
  }
}
