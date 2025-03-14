import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/gen/assets.gen.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/edit%20epic/model/epic_name.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/action_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/dialogs/common_dialog.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

class EditEpicPage extends BasePage {
  const EditEpicPage({super.key});
  @override
  _EditEpicPageState createState() => _EditEpicPageState();
}

class _EditEpicPageState extends BaseState<EditEpicPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.white,
      appBar: actionAppbar(backGroundColor: R.color.white, title: R.strings.edit_epic, action: [
        IconButton(
            onPressed: () => _showDialogsDelete(),
            icon: SvgPicture.asset(Assets.lib.res.drawables.icDelete))
      ]),
      body: _buildBody(_formKey),
      bottomNavigationBar: _buildButtonBottom(_formKey),
    );
  }

  Widget _buildBody(GlobalKey<FormState> formkey) {
    DropDownController<EpicName> dropDownController =
        DropDownController<EpicName>(initialItemList: EpicName.values);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 27),
      child: CommonForm(
        key: formkey,
        child: Column(
          children: [
            CommonTextFormField(
              label: R.strings.epic_name,
              isRequired: true,
              hintText: R.strings.name_of_task,
            ),
            SizedBox(
              height: 15,
            ),
            DropdownFormField(
              label: R.strings.type_name_of_epic,
              hintText: R.strings.select_type_name_epic,
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

  Future<void> _showDialogsDelete() async {
    final dialogResult = await NavigatorUltils.pushDialog<bool>(context,
        dialog: CommonDialog(
          title: Text(R.strings.deleted ),
          description: Text(R.strings.are_you_sure_deleted_this_task),
          actionButtons: [
            ButtonWithIconWidget(
              onPressed: () {
                NavigatorUltils.safePop(context, false);
              },
              title: R.strings.no,
              textColor: R.color.text,
              backgroundColor: R.color.F2F2F2,
            ),
            ButtonWithIconWidget(
              onPressed: () {
                NavigatorUltils.safePop(context, true);
              },
              title: R.strings.yes,
            )
          ],
        ));
    if (dialogResult == true) {
      popPage();
    } else if (dialogResult == false) {}
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
