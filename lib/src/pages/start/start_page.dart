import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/gen/assets.gen.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/login/login_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/register/register_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/start/start_bloc.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/loading/loading_overlay.dart';

class StartPage extends BasePage {
  const StartPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends BaseState<StartPage> {
  late StartBloc _bloc;

  void _setupBloc() {
    _bloc = StartBloc();
    _bloc.listenAction(
      cancelSubOnDispose,
      (action) {
        switch (action) {
          case ActionNavigateLoginPage():
            NavigatorUltils.navigatePage(context, LoginPage()).then((_) {
              _bloc.add(EventNavigateSuccess());
            });
          case ActionNavigateRegisterPage():
            NavigatorUltils.navigatePage(context, RegisterPage()).then((_) {
              _bloc.add(EventNavigateSuccess());
            });
        }
      },
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartBloc, PageState>(
      bloc: _bloc,
      builder: (BuildContext context, PageState state) {
        return LoadingOverlay(isLoading: state.showLoading, child: _buildPageContent());
      },
    );
  }

  Widget _buildPageContent() {
    return Scaffold(
      backgroundColor: R.color.background_light,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 37),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.lib.res.drawables.imgLogoLogin.path),
            SizedBox(
              height: 23,
            ),
            _buildButton(
                context: context,
                color: R.color.textLight,
                title: R.strings.login,
                onPressed: eventNavigateLoginPage),
            SizedBox(
              height: 23,
            ),
            _buildButton(
                context: context,
                color: R.color.white,
                title: R.strings.sign_up,
                onPressed: eventNavigateRegisterPage),
            SizedBox(
              height: 27,
            ),
          ],
        ),
      ),
    );
  }

  void eventNavigateLoginPage() {
    _bloc.add(EventNavigateLoginPage());
  }

  void eventNavigateRegisterPage() {
    _bloc.add(EventNavigateRegisterPage());
  }

  Widget _buildButton({
    required BuildContext context,
    required String title,
    required Color color,
    required void Function() onPressed,
  }) {
    return ButtonWithIconWidget(
      radius: 30,
      height: 45,
      backgroundColor: R.color.colorPrimaryButton,
      onPressed: onPressed,
      title: title,
      titleStyle: R.textStyle.inter_semibold_20_600,
      textColor: color,
    );
  }
}
