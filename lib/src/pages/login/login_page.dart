import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/preferences/show_intro_usecase.dart';
import 'package:schedule_gen_and_time_management/gen/assets.gen.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/auth/auth_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/forgot_password/forgot_password_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/login/login_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/onboarding/on_boarding_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/register/register_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/utils/validator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/back_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/container_decoration.dart';
import 'package:schedule_gen_and_time_management/src/widgets/loading/loading_overlay.dart';
import 'package:schedule_gen_and_time_management/src/widgets/rich_text.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';

class LoginPage extends BasePage {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {
  late LoginBloc _bloc;

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
    final ShowIntroUsecase showIntroUsecase = ShowIntroUsecase();
    _bloc = LoginBloc();
    _bloc.listenAction(cancelSubOnDispose, (action) {
      switch (action) {
        case ActionShowError():
          ToastUtils.showErrorToast(context, message: action.error);
        case ActionLoginSuccessFull():
         _testCallAuthBloc ();
          if (showIntroUsecase.showIntro == true) {
            NavigatorUltils.pushAndRemoveUntilPage(context, OnBoardingPage());
          }
          else {
            NavigatorUltils.pushAndRemoveUntilPage(context , LoginPage());
          }
      }
    });
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, PageState>(
      bloc: _bloc,
      builder: (context, state) {
        return LoadingOverlay(
          isLoading: state.showLoading,
          child: Scaffold(
            appBar: buildBackAppBar(
                context: context, color: R.color.white, backGroundColor: Colors.transparent),
            resizeToAvoidBottomInset: false,
            backgroundColor: R.color.app_color,
            body: SafeArea(
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    R.strings.welcome_login,
                    style: R.textStyle.inter_semibold_30_600.copyWith(color: R.color.white),
                  ),
                  SizedBox(height: 111),
                  Expanded(
                    child: ContainerDecoration(
                      padding: EdgeInsets.symmetric(horizontal: 36),
                      child: _buildLoginWidget(_formkey, state, context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoginWidget(GlobalKey<FormState> formkey, PageState state, BuildContext context) {
    return SizedBox(
      child: CommonForm(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonTextFormField(
              validator: (value) => ValidatorUltils.validateEmail(value),
              keyboardType: TextInputType.emailAddress,
              maxLength: 25,
              label: R.strings.email,
              isRequired: true,
              hintText: R.strings.example_email,
              onSaved: (newValue) {
                _bloc.add(EventEmailSubmited(email: newValue));
              },
            ),
            SizedBox(height: 20),
            CommonTextFormField(
              maxLength: 25,
              enableInteractiveSelection: false,
              // ngăn k cho người dùng coppy văn bản
              obscureText: state.dontShowPassword,
              // obcureText : true văn bản sẽ ẩn
              style: R.textStyle.inter_medium_14_500.copyWith(color: R.color.text),
              suffixIcon: GestureDetector(
                onTap: () {
                  _showPassword();
                },
                child: state.dontShowPassword
                    ? Container(
                        padding: EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          Assets.lib.res.drawables.icNotSeePassword,
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          Assets.lib.res.drawables.icSeePassword,
                        ),
                      ),
              ),
              label: R.strings.password,
              isRequired: true,
              hintText: R.strings.enter_your_password,
              onSaved: (newvalue) {
                _bloc.add(EventPasswordSubmited(password: newvalue));
              },
            ),
            SizedBox(height: 52),
            ButtonWithIconWidget(
              width: 207,
              onPressed: () {
                _onLogin();
              },
              title: R.strings.login,
              titleStyle: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.textLight),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () => _navigatePage(context, ForgotPasswordPage()),
              child: Text(
                R.strings.forgot_password,
                style: R.textStyle.inter_semibold_14_600
                    .copyWith(decoration: TextDecoration.underline, color: R.color.text),
              ),
            ),
            SizedBox(height: 30),
            ButtonWithIconWidget(
              iconAsset: Assets.lib.res.drawables.icAdd,
              width: 207,
              onPressed: () {
                _navigatePage(context, RegisterPage());
              },
              title: R.strings.sign_up,
              titleStyle: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.white),
            ),
            SizedBox(height: 46),
            SizedBox(
              height: 40,
              child: GestureDetector(
                  onTap: () {
                    _navigatePage(context, RegisterPage());
                  },
                  child: buildRichtextDefault(
                      mainTitle: R.strings.dont_have_an_account, subtitle: R.strings.sign_up)),
            )
          ],
        ),
      ),
    );
  }

  void _testCallAuthBloc () {
      final authen = BlocProvider.of<AuthBloc>(context);
      authen.add(EventRefreshSession());
  }
  void _navigatePage(BuildContext context, Widget widget) {
    NavigatorUltils.navigatePage(context, widget);
  }

  void _showPassword() {
    _bloc.add(EventShowPassword());
  }

  void _onLogin() {
    if (_formkey.currentState?.validate() ?? false) {
      _formkey.currentState?.save();
      _bloc.add(EventHandleLogin());
    }
  }
}
