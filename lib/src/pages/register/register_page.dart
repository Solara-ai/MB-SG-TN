import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/gen/assets.gen.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/login/login_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/otp/otp_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/register/register_bloc.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/validator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/back_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/container_decoration.dart';
import 'package:schedule_gen_and_time_management/src/widgets/rich_text.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/date_time_form_field.dart';

class RegisterPage extends BasePage {
  @override
  _RegisterPageState createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends BaseState<RegisterPage> {
  late RegisterBloc _bloc;

  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    _setupBloc();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setupBloc() {
    _bloc = RegisterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, PageState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: buildBackAppBar(
              context: context, backGroundColor: Colors.transparent, color: R.color.white),
          backgroundColor: R.color.app_color,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  R.strings.create_account,
                  style: R.textStyle.inter_semibold_30_600.copyWith(color: R.color.white),
                ),
                SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                   minHeight : 736
                  ),
                  child: ContainerDecoration(
                    padding: EdgeInsets.symmetric(horizontal: 37),
                    child: _buildRegister(context, state, _formkey),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRegister(BuildContext context, PageState state, GlobalKey<FormState> fomrKey) {
    return CommonForm(
      key: fomrKey,
      child: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            CommonTextFormField(
                isRequired: true,
                maxLength: 25,
                label: R.strings.full_name,
                hintText: R.strings.enter_your_full_name),
            SizedBox(height: 18),
            CommonTextFormField(
              validator:(value) => ValidatorUltils.validateEmail(value),
              keyboardType: TextInputType.emailAddress,
              isRequired: true,
              maxLength: 25,
              label: R.strings.email,
              hintText: R.strings.example_email,
            ),
            SizedBox(height: 18),
            CommonTextFormField(
              isRequired: true,
              cursorColor: R.color.text,
              maxLength: 10,
              label: R.strings.mobile_number,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 18),
            DateTimeFormFieldWidget(
              title: R.strings.date_of_birth,
              isEnabled: true,
              onSaved: (DateTime) {},
            ),
            SizedBox(height: 18),
            CommonTextFormField(
              validator: (value) => ValidatorUltils.validatePassword(value),
              showCursor: state.dontShowPassword,
              label: R.strings.password,
              suffixIcon: GestureDetector(
                onTap: () {
                  _onShowPassword();
                },
                child: _iconShowPassword(state)
              ),
              enableInteractiveSelection: false,
              isRequired: true,
            ),
            SizedBox(height: 18),
            CommonTextFormField(
              validator: (value) => ValidatorUltils.validatePassword(value),
              showCursor: state.dontShowConfirmPassword,
              label: R.strings.confirm_password,
              suffixIcon: GestureDetector(
                onTap: () {
                  _onShowConfirmPassword();
                },
                child: _iconShowConfirmPassword(state)
              ),
              enableInteractiveSelection: false,
              isRequired: true,
            ),
            SizedBox(height: 18),
            ButtonWithIconWidget(
              width: 207,
              onPressed: () {
                _handleSignUp();
              },
              title: R.strings.sign_up,
              titleStyle: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.textLight),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: GestureDetector(
                  onTap: () {
                    NavigatorUltils.pushAndRemoveUntilKeepFirstPage(context, LoginPage());
                  },
                  child: buildRichtextDefault(
                      mainTitle: R.strings.already_have_an_account, subtitle: R.strings.login)),
            )
          ],
        ),
      ),
    );
  }

  Widget _iconShowPassword(PageState state) {
    return state.dontShowPassword
        ? Container(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              Assets.lib.res.drawables.icNotSeePassword,
            ))
        : Container(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              Assets.lib.res.drawables.icSeePassword,
            ));
  }

  Widget _iconShowConfirmPassword(PageState state) {
    return state.dontShowConfirmPassword
        ? Container(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              Assets.lib.res.drawables.icNotSeePassword,
            ))
        : Container(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              Assets.lib.res.drawables.icSeePassword,
            ));
  }


  void _onShowPassword() {
    _bloc.add(EventShowPassword());
  }

  void _onShowConfirmPassword() {
    _bloc.add(EventShowConfirmPassword());
  }

  void _handleSignUp() {
    if (_formkey.currentState?.validate() ?? false) {
      _formkey.currentState?.save();
    }
  }
}
