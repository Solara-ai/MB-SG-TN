import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/edit%20profile/edit_profile_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/register/model/gender.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/widgets/custom_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/date_time_form_field.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

class EditProfilePage extends BasePage {
  const EditProfilePage({super.key});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends BaseState<EditProfilePage> {
  late EditProfileBloc _bloc;

  @override
  void initState() {
    _setupBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _setupBloc() {
    _bloc = EditProfileBloc();
    _bloc.listenAction(cancelSubOnDispose, (action) {
      switch (action) {
        case ActionLoaddedProfileFaild():
          ToastUtils.showErrorToast(context, message: action.message);
        case ActionUpdateProfileFaild():
          ToastUtils.showErrorToast(context, message: action.error);
        case ActionUpdateProfileSuccess():
          ToastUtils.showSuccessToast(context, message: R.strings.updateProfileSuceess);
          popPage(result: true);
      }
    });
  }

  final _formkey = GlobalKey<FormState>();
  final DropDownController drController =
      DropDownController<MaleUser>(initialItemList: MaleUser.values);
  final TextEditingController _controllerfullName = TextEditingController();
  final TextEditingController _controllerOcupation = TextEditingController();
  final TextEditingController _controllerbirthDay = TextEditingController();
  final TextEditingController _controllerphoneNumber = TextEditingController();
  final TextEditingController _controlleremail = TextEditingController();
  final TextEditingController _controllerhobbies = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, PageState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state.userProfile != null) {
            _controllerfullName.text = state.userProfile!.fullName;
            _controllerbirthDay.text =
                state.birthDay.formatToString(DateFormatType.ddMMyyyy.pattern);
            _controllerphoneNumber.text = state.userProfile!.phone;
            _controllerOcupation.text = state.userProfile!.occupation;
            _controllerhobbies.text = state.userProfile!.hobbies;
            _controlleremail.text = state.userProfile!.email;
            drController.value = maleUser(state.userProfile!.gender);
          }
          return Scaffold(
            backgroundColor: R.color.white,
            appBar: appBar(R.strings.edit_profile, action: [
              GestureDetector(
                onTap: () {
                  print('required password: ${state.requiredPassword}');
                  print('required password again: ${state.requiredPasswordAgain}');
                  _onSave();
                },
                child: Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    R.strings.save,
                    style: R.textStyle.inter_semibold_14_600.copyWith(color: R.color.text),
                  ),
                ),
              )
            ]),
            body: _buildBodyEditProfile(state),
          );
        });
  }

  Widget _buildBodyEditProfile(PageState state) {
    return SingleChildScrollView(
      child: CommonForm(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // full name
              CommonTextFormField(
                controller: _controllerfullName,
                label: R.strings.full_name,
                hintText: R.strings.enter_your_full_name,
                isRequired: true,
                onSaved: (newValue) {
                  _bloc.add(EventUserChangeFullName(fullName: newValue));
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(R.strings.about_you,
                  style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text)),
              SizedBox(
                height: 10,
              ),
              DropdownFormField(
                label: R.strings.gender,
                controller: drController,
                hintText: R.strings.gender_user,
                isRequired: true,
                onSavedItem: (value) {
                  _bloc.add(EventUserChangeGender(gender: value?.value));
                },
              ),
              SizedBox(
                height: 16,
              ),
              // birthDay
              DateTimeFormFieldWidget(
                textController: _controllerbirthDay,
                title: R.strings.date_of_birth,
                isEnabled: true,
                isRequired: true,
                onSaved: (DateTime) {
                  _bloc.add(EventUserChangeBirthDay(birthDay: DateTime));
                },
              ),
              SizedBox(
                height: 28,
              ),
              Text(R.strings.more_about_you,
                  style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text)),
              SizedBox(
                height: 10,
              ),
              // phone number
              CommonTextFormField(
                controller: _controllerphoneNumber,
                label: R.strings.phone_number,
                isRequired: true,
                maxLength: 10,
                keyboardType: TextInputType.number,
                onSaved: (newValue) {
                  _bloc.add(EventUserChangePhone(phone: newValue));
                },
              ),
              SizedBox(
                height: 16,
              ),
              // email
              CommonTextFormField(
                controller: _controlleremail,
                label: R.strings.email,
                hintText: R.strings.example_email,
                enabled: false,
                onSaved: (newValue) {
                  _bloc.add(EventUserChangeEmail(email: newValue));
                },
              ),
              SizedBox(
                height: 16,
              ),
              CommonTextFormField(
                controller: _controllerhobbies,
                label: R.strings.hobbies,
                minLines: 5,
                maxLines: 8,
                hintText: R.strings.hobbies,
                onSaved: (newValue) {
                  _bloc.add(EventUserChangeHobbies(hobbies: newValue));
                },
              ),
              SizedBox(
                height: 16,
              ),
              CommonTextFormField(
                controller: _controllerOcupation,
                label: R.strings.occupation,
                onSaved: (newValue) {
                  _bloc.add(EventUserChangeoccupation(ocupation: newValue));
                },
              ),
              SizedBox(
                height: 16,
              ),
              CommonTextFormField(
                label: R.strings.password,
                onChanged: (value) {
                  _bloc.add(EventRequiredPaswordAgain());
                },
                hintText: R.strings.password,
                isRequired: state.requiredPassword,
                controller: _passwordControler,
              ),
              SizedBox(
                height: 16,
              ),
              CommonTextFormField(
                onChanged: (value) {
                  _bloc.add(EventRequiredPassword());
                },
                isRequired: false,
                label: R.strings.confirm_password,
                hintText: R.strings.confirm_password,
                validator: (value) => _checkConfirmPassword(value),
                onSaved: (newValue) {
                  _bloc.add(EventUserChangePassword(password: newValue));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  MaleUser maleUser(String value) {
    if (value == MaleUser.MALE.value) {
      return MaleUser.MALE;
    } else {
      return MaleUser.FEMALE;
    }
  }

  void _onSave() {
    if (_formkey.currentState?.validate() ?? false) {
      _formkey.currentState?.save();
      _bloc.add(EventUpdateProfile());
    }
  }

  String? _checkConfirmPassword(String? value) {
    if (!value.isNullOrEmpty() && !_passwordControler.text.isNullOrEmpty()) {
      if (value == _passwordControler.text) {
        return null;
      } else {
        return R.strings.Passwords_must_match;
      }
    }
    return null;
  }
}
