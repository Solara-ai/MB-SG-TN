import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/register/model/gender.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/custom_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/date_time_form_field.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

class EditProfilePage extends BasePage {
  const EditProfilePage ({super.key});
  @override 
  _EditProfilePageState createState () => _EditProfilePageState ();
}

class _EditProfilePageState extends BaseState <EditProfilePage> {

  final _formkey = GlobalKey<FormState>();
  final DropDownController drController = DropDownController<MaleUser>(initialItemList: MaleUser.values);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.white,
      appBar: appBar(R.strings.edit_profile , action: [
          GestureDetector(
          onTap: _onSave,
          child: Container(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              R.strings.save,
              style: R.textStyle.inter_semibold_14_600.copyWith(color: R.color.text),
            ),
          ),
        )
      ]),
      body: _buildBodyEditProfile() ,
    );
  }

  Widget _buildBodyEditProfile () {
    return SingleChildScrollView(
      child: CommonForm(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextFormField(
                label: R.strings.full_name,
                hintText: R.strings.enter_your_full_name,
                isRequired: true,
              ),
              SizedBox(height: 15,),
              Text(R.strings.about_you , style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text)),
              SizedBox(height: 10,),
              DropdownFormField(
                label: R.strings.gender,
                controller: drController ,
                hintText: R.strings.gender_user,
              ),
              SizedBox(height: 16 ,),
              DateTimeFormFieldWidget(
              title: R.strings.date_of_birth,
              isEnabled: true,
              onSaved: (DateTime) {},
            ),
              SizedBox(height: 28 ,),
              Text(R.strings.more_about_you , style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text)),
              SizedBox(height: 10,),
              CommonTextFormField(
                label: R.strings.phone_number,
                isRequired: true,
                maxLength: 10,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16 ,),
              CommonTextFormField(
                label: R.strings.email,
                hintText: R.strings.example_email,
                enabled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSave () {
    if (_formkey.currentState?.validate() ?? false) {
      NavigatorUltils.safePop(context);
    }
  }
}