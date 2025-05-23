import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/session_usecase.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/drawer/drawer_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/home/home_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/performance_evaluation/performance_evaluation_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/profile/proflie_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/schedules/schedule_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/settings/settings_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/start/start_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage/task_manage_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/build_context_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';

class DrawerBase extends BasePage {
  const DrawerBase({super.key});
  @override
  _DrawerBaseState createState() => _DrawerBaseState();
}

class _DrawerBaseState extends BaseState<DrawerBase> {
  late DrawerBloc _drawerBloc;

  @override
  void initState() {
    _setupBloc();
    super.initState();
    _drawerBloc.add(EventInitilize());
  }

  @override
  void dispose() {
    _drawerBloc.close();
    super.dispose();
  }

  void _setupBloc() {
    _drawerBloc = DrawerBloc();
    _drawerBloc.listenAction(
      cancelSubOnDispose,
      (action) {
        switch (action) {
          case ActionNavigateHomePage():
            NavigatorUltils.pushAndRemoveUntilPage(context, HomePage());
          case ActionNavigateTaskManagePage():
            NavigatorUltils.pushAndRemoveUntilPage(context, TaskManagerPage());
          case ActionNavigateSettingsPage():
            NavigatorUltils.pushAndRemoveUntilPage(context, SettingsPage());
          case ActionNavigatePerformance():
            NavigatorUltils.pushAndRemoveUntilPage(context, PerformanceEvaluationPage());
          case ActionNavigateSchedulesPage():
            NavigatorUltils.pushAndRemoveUntilPage(context, SchedulePage());
          case ActionNavigateEditProfilePage():
            NavigatorUltils.navigatePage(context, ProfliePage());
          case ActionLogout():
            NavigatorUltils.pushAndRemoveUntilPage(context, StartPage());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, PageState>(
      bloc: _drawerBloc,
      builder: (context, state) => Drawer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderDrawer(state),
          Expanded(child: _buildMenuItemDrawer(state)),
        ],
      )),
    );
  }

  Widget _buildHeaderDrawer(PageState state) {
    return Container(
      height: 300,
      decoration: BoxDecoration(color: R.color.app_color),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            CircleAvatar( 
              radius: 80,
              child: SvgPicture.asset(R.drawables.ic_default_user),
            ),
            SizedBox(
              height: 15,
            ),
            state.userProfile == null ?
            Text(R.strings.full_name,
                style: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.white))
                :  Text(state.userProfile!.fullName,
                style: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.white)),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 150,
              height: 40,
              child: GestureDetector(
                onTap: _NavigateEditProfilePage,
                child: Text(
                  textAlign: TextAlign.center,
                  R.strings.edit_profile,
                  style: R.textStyle.inter_light_14_300.copyWith(
                      color: R.color.white,
                      decoration: TextDecoration.underline,
                      decorationColor: R.color.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItemDrawer(PageState state) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          ListTile(
              leading: SvgPicture.asset(R.drawables.ic_schedule),
              title: Text(R.strings.schedule,
                  style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.text)),
              onTap: _NavigateSchedulePage),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: SvgPicture.asset(R.drawables.ic_task_manage),
              title: Text(R.strings.task_manage,
                  style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.text)),
              onTap: _NavigateTaskManagePage),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: SvgPicture.asset(R.drawables.ic_settings),
              title: Text(R.strings.settings,
                  style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.text)),
              onTap: _NavigateSettingsPage),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: SvgPicture.asset(R.drawables.ic_performance_evaluation),
              title: Text(R.strings.performance_evaluation,
                  style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.text)),
              onTap: _NavigatePerformancePage),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: SvgPicture.asset(R.drawables.ic_logout),
              title: Text(R.strings.logout,
                  style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.text)),
              onTap: _Logout),
        ],
      ),
    );
  }

  void _NavigateEditProfilePage() {
    _drawerBloc.add(EventNavigateEditProfilePage());
    context.popScreen();
  }

  void _NavigateTaskManagePage() {
    _drawerBloc.add(EventNavigateTaskManagePage());
    context.popScreen();
  }

  void _NavigateSettingsPage() {
    _drawerBloc.add(EventNavigateSettingsPage());
    context.popScreen();
  }

  void _NavigateSchedulePage() {
    _drawerBloc.add(EventNavigateSchedulePage());
    context.popScreen();
  }

  void _NavigatePerformancePage() {
    _drawerBloc.add(EventNavigatePerfomanceEvaluation());
    context.popScreen();
  }

  void _Logout() {
    _drawerBloc.add(EventLogout());
  }
}
