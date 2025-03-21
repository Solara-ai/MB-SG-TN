import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/model/all_epic.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/model/list_app_epic.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/select_option_dialog.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

class CreateNewPlanPage extends BasePage {
  @override
  _CreateNewPlanPageState createState() => _CreateNewPlanPageState();
}

class _CreateNewPlanPageState extends BaseState<CreateNewPlanPage> {
  final DropDownController<AllEpic> _dropDownController =
      DropDownController<AllEpic>(initialItemList: allEpic);
  @override
  Widget build(BuildContext context) {
    return _builPageContent();
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 40,
        ),
        Text(
          R.strings.create_new_plan,
          style: R.textStyle.inter_semibold_18_600,
        ),
        CupertinoButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(R.drawables.ic_close2))
      ],
    );
  }

  Widget _builPageContent() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(
              height: 16,
            ),
            // _buildChoseTask(),
            SizedBox(
              height: 16,
            ),
            _buildChooseEpic(),
          ],
        ),
      ),
    );
  }

  // Widget _buildChoseTask() {
  //   return _buildTextFormFiledChoseTask(
  //     title: R.strings.choose_tasks,
  //     hintext: R.strings.select_task,
  //     ontap: () {
  //       Navigator.of(context).push(
  //         PageRouteBuilder(
  //           pageBuilder: (context , _ , __) => SelectOptionDialog(title: R.strings.select_the_tasks,),
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget _buildChooseEpic() {
    return DropdownFormField(
      controller: _dropDownController,
      label: R.strings.choose_epic,
      hintText: R.strings.choose_epic,
    );
  }

  Widget _buildTextFormFiledChoseTask(
      {required String title, required String hintext, required void Function() ontap}) {
    return Column(
      children: [
        Text(
          R.strings.choose_tasks,
          style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.text),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: ontap,
          child: Container(
            constraints:
                BoxConstraints(minHeight: 40, minWidth: double.infinity, maxWidth: double.infinity),
            decoration: BoxDecoration(
                color: R.color.white,
                border: Border.all(color: R.color.colorBorder),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(hintext,
                      style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.hint_text)),
                  Expanded(child: SvgPicture.asset(R.drawables.ic_expan_more))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
