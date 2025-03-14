import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/gen/assets.gen.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/detail%20task/model/status_detail_task.dart';
import 'package:schedule_gen_and_time_management/src/pages/edit_task/edit_task_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/action_appbar.dart';

class DetailTaskPage extends BasePage {
  const DetailTaskPage({super.key});

  @override
  _DetailTaskPageState createState() => _DetailTaskPageState();
}

class _DetailTaskPageState extends BaseState<DetailTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: actionAppbar(
          title: R.strings.detail_task,
          textStyle: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: R.color.text),
            onPressed: () => Navigator.of(context).pop(),
          ),
          action: [
            IconButton(onPressed: () {
              NavigatorUltils.navigatePage(context, EditTaskPage());
            }, icon: SvgPicture.asset(Assets.lib.res.drawables.icEdit, width: 22 , height: 22,))
          ],
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 41 , horizontal: 37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(Assets.lib.res.drawables.imgTask.path),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            R.strings.name_of_task,
            style: R.textStyle.inter_semibold_16_600.copyWith(color: R.color.text),
          ),
          SizedBox(height: 19),
          Text('Description of task',
              style: R.textStyle.inter_medium_12_500.copyWith(color: R.color.colorTextDescription)),
          SizedBox(height: 47),
          Text(
            R.strings.name_of_epic,
            style: R.textStyle.inter_semibold_16_600.copyWith(color: R.color.text),
          ),
          SizedBox(height: 19),
          Text(
            R.strings.status,
            style: R.textStyle.inter_semibold_16_600.copyWith(color: R.color.text),
          ),
          SizedBox(height: 13),
          statusDetailTask('todo')
        ],
      ),
    );
  }
}
