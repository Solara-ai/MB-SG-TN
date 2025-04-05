import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/fedd_back/feed_back_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/base_scafold/base_scaffold_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/custom_appbar.dart';

class SettingsPage extends BasePage {
  const SettingsPage({super.key});
  @override 
  _SettingsPageState createState () => _SettingsPageState();
}

class _SettingsPageState extends BaseState<SettingsPage> {
   @override
  Widget build(BuildContext context) {
    return BaseScaffoldPage(
      appbar: appBar(R.strings.settings),
      body: _buildBody() ,
    );
  }

  Widget _buildBody () {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 20 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemSettings ( funciton: () => NavigatorUltils.navigatePage(context, FeedBackPage()),  title:  R.strings.fedd_back , widget: _buildIcon()),
          SizedBox(height: 22 ,) ,
           _buildItemSettings ( title:  R.strings.push_notification , widget: _buildIcon()),
          SizedBox(height: 22 ,) ,
           _buildItemSettings (title:  R.strings.dark_mode , widget: _buildIcon()),
          SizedBox(height: 22 ,) ,
           _buildItemSettings (title:  R.strings.language , widget: _buildIcon()),
          SizedBox(height: 22 ,) ,
           _buildItemSettings (title:  R.strings.about_application , widget: _buildIcon()),
          SizedBox(height: 22 ,) ,
           _buildItemSettings (title:  R.strings.help , widget: _buildIcon()),
        ],
      ),
    );
  }

  Widget _buildIcon () {
    return SvgPicture.asset(R.drawables.Arrow_right);
  }

  Widget _buildItemSettings ({required String title , required Widget widget , void Function () ? funciton }) {
    return GestureDetector(
      onTap: funciton,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 19),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: R.color.e9f1ff),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(title , style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.text))),
            widget
          ],
        ),
      ),
    );
  }
}