import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/edit%20epic/model/epic_name.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/model/all_epic.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/model/list_app_epic.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/action_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

class AddTaskPage extends BasePage {
  const AddTaskPage({super.key});
  @override 
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends BaseState<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.white,
      appBar: actionAppbar(backGroundColor: R.color.white, title: R.strings.add_task),
      body: _buildBody(_formKey),
      bottomNavigationBar: _buildButtonBottom(_formKey),
    );
  }

  Widget _buildBody(GlobalKey<FormState> formkey) {
    DropDownController<AllEpic> dropDownController =
        DropDownController<AllEpic>(initialItemList: allEpic);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 27),
      child: CommonForm(
        key: formkey,
        child: Column(
          children: [
            CommonTextFormField(
              label: R.strings.task_name,
              isRequired: true,
              hintText: R.strings.name_of_task,
            ),
            SizedBox(
              height: 15,
            ),
            DropdownFormField<AllEpic>(
              label: R.strings.select_epic,
              isRequired: true,
              controller: dropDownController,
            ),
            SizedBox(
              height: 15,
            ),
            CommonTextFormField(
              label: R.strings.description,
              isRequired: false,
              hintText: R.strings.write_description_here,
              maxLength: 120,
              minLines: 4,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }

   Widget _buildButtonBottom(GlobalKey<FormState> formkey) {
    return SafeArea(
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 31, horizontal: 15),
            child: ButtonWithIconWidget(
              title: R.strings.save,
              onPressed: () {
                if (formkey.currentState?.validate() ?? false) {}
              },
            )));
  }

}