import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/home/home_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/profile/proflie_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/settings/settings_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/start/start_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage/task_manage_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/build_context_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';

class BaseScaffoldPage extends BasePage {
  final AppBar ? appbar ;
  final Widget ? body ;
  final Widget ? floatingActionButton;
  const BaseScaffoldPage ({this.appbar , this.body , this.floatingActionButton ,super.key});
  @override
  _BaseScaffoldState createState() =>_BaseScaffoldState();
}

class _BaseScaffoldState extends BaseState<BaseScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appbar,
      drawer:buildDrawer() ,
      backgroundColor: R.color.white,
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
    );
  }

  Widget _buildHeaderDrawer() {
    return Container(
      height: 300,
      decoration: BoxDecoration(color: R.color.app_color),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(R.drawables.user),
              radius: 80,
            ),
            SizedBox(
              height: 15,
            ),
            Text(R.strings.full_name,
                style: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.white)),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 150,
              height: 40, 
              child: GestureDetector(
                onTap: () {
                  NavigatorUltils.navigatePage(context, ProfliePage());
                },
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

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderDrawer(),
          Expanded(child: _buildMenuItemDrawer()),
        ],
      ),
    );
  }

  Widget _buildMenuItemDrawer() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          ListTile(
            leading: SvgPicture.asset(R.drawables.ic_home),
            title: Text(R.strings.home,
                style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.text)),
            onTap: () {
              NavigatorUltils.pushAndRemoveUntilPage(context, HomePage());
              context.popScreen();
            },
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: SvgPicture.asset(R.drawables.ic_task_manage),
            title: Text(R.strings.task_manage,
                style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.text)),
            onTap: () {
               NavigatorUltils.pushAndRemoveUntilPage(context, TaskManagerPage());
              context.popScreen();
            },
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: SvgPicture.asset(R.drawables.ic_settings),
            title: Text(R.strings.settings,
                style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.text)),
            onTap: () {
              NavigatorUltils.pushAndRemoveUntilPage(context, SettingsPage());
              context.popScreen();
            },
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: SvgPicture.asset(R.drawables.ic_logout),
            title: Text(R.strings.logout,
                style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.text)),
            onTap: () {
              NavigatorUltils.pushAndRemoveUntilPage(context, StartPage());
            },
          ),
        ],
      ),
    );
  } 
}