import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/custom_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';

class FeedBackPage extends BasePage {
  @override 
  _FeedBackPageState createState() => _FeedBackPageState ();
}

class _FeedBackPageState extends BaseState<FeedBackPage> {

  final _formKey = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: R.color.white,
      appBar: appBar(R.strings.fedd_back),
      body: _buildBody() ,
      bottomNavigationBar: _buildButtonBottom(),
     );
  }
  Widget _buildBody () {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CommonForm(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(R.strings.how_can_we_help_you , style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text),),
             SizedBox(height: 5,),
             Text(R.strings.description_feedback , style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.textDescriptionFeddBack),),
             SizedBox(height: 5,),
             CommonTextFormField(
              validator: (value) => value.isNullOrEmpty() ? R.strings.please_enter_your_feddback : null ,
              cursorColor: R.color.text,
              minLines: 5,
              maxLines: 8,
              maxLength: 500,
              hintText: R.strings.type_your_message_here,
              hintStyle: R.textStyle.inter_medium_16_500.copyWith(color:R.color.inputColorTextPlaceholder) ,
             )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonBottom () {
      return SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ButtonWithIconWidget(onPressed: onSend , title: R.strings.send,)
        ),
      );
  }

  void onSend () {
     if (_formKey.currentState?.validate() ?? false) {
       print('validate success');
     }
  }
}