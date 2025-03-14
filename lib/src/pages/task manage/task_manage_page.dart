import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rxdart/rxdart.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/task_manage_tab_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage/model/task_manage_tab.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/floating_action_button.dart';
import 'package:schedule_gen_and_time_management/src/widgets/custom_appbar.dart';

class TaskManagerPage extends BasePage {
  const TaskManagerPage({super.key});
  static final changePage = PublishSubject<int>();
  @override
  _TaskManagerPageState createState() => _TaskManagerPageState();
}

class _TaskManagerPageState extends BaseState<TaskManagerPage> with SingleTickerProviderStateMixin {
  List<TaskManageTab> tab = [TaskManageTab.ALL, TaskManageTab.WORK, TaskManageTab.STUDY];

  late TabController _tabController;
  late StreamSubscription _subscription;

  @override
  void initState() {
    _tabController = TabController(length: tab.length, vsync: this);
    _subscription = TaskManagerPage.changePage.listen((index) {
      _tabController.animateTo(index);
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.white,
      appBar: appBar(
        R.strings.task_manage,
        textStyle: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text),
      ),
      floatingActionButton: buildFloatingButton(context: context) ,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TabBar(
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed)) {
                  return R.color.A8A8E.withOpacity(0.1); // Màu khi nhấn vào tab
                }
                return null;
              }),
              dividerColor: Colors.transparent, // xóa bỏ dòng kẻ bên dưới tabar
              indicatorColor: R.color.app_color, // hiệu ứng dòng kẻ khi select tab
              labelStyle: R.textStyle.inter_regular_16_400.copyWith(color: R.color.app_color),
              indicatorSize: TabBarIndicatorSize.tab, // chiều dài của Indicator
              unselectedLabelStyle:
                  R.textStyle.inter_regular_16_400.copyWith(color: R.color.colorTextLabel),
              indicatorWeight: 2 , // độ rộng của Indicator
              controller: _tabController,
              tabs: tab
                  .map((tab) => Tab(
                        text: tab.tiltle,
                      ))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 21,
          ),
          Expanded(
              child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: tab.map((element) => TaskManageTabPage(tab: element)).toList()))
        ],
      ),
    );
  }
}
