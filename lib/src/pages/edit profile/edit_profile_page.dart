import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/widgets/custom_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';

class EditProfilePage extends BasePage {
  const EditProfilePage ({super.key});
  @override 
  _EditProfilePageState createState () => _EditProfilePageState ();
}

class _EditProfilePageState extends BaseState <EditProfilePage> {

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(R.strings.save , action: [
          GestureDetector(
          child: Container(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              R.strings.edit,
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
              SizedBox(height: 15,),
              Text(R.strings.about_you , style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text)),
              SizedBox(height: 10,),
              CommonTextFormField(

              ),
              SizedBox(height: 16 ,),
              CommonTextFormField(

              ),
              SizedBox(height: 28 ,),
              Text(R.strings.more_about_you , style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text)),
              CommonTextFormField(
                
              ),
              SizedBox(height: 16 ,),
            ],
          ),
        ),
      ),
    );
  }
}