import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/chat_bot/chat_bot_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/home/home_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/onboarding/on_boarding_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/schedules/schedule_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';

class OnBoardingPage extends BasePage {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends BaseState<OnBoardingPage> {
  late final OnBoardingBloc _bloc;
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
    _bloc = OnBoardingBloc();
    _bloc.listenAction(
      cancelSubOnDispose,
      (action) {
        switch (action) {
          case ActionNavigateHomePage():
            NavigatorUltils.navigatePage(context, SchedulePage());
          case ActionNavigateChatPage():
            NavigatorUltils.navigatePage(context, ChatBotPage());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, PageState>(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: R.color.white,
          actions: [
            GestureDetector(
              onTap: _skipOnboardingPage,
              child: Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.symmetric(vertical: 10 ),
                child: Text(
                  R.strings.skip,
                  style: R.textStyle.inter_medium_14_500.copyWith(color: R.color.app_color),
                ),
              ),
            )
          ],
        ),
        backgroundColor: R.color.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  R.strings.title_onboard,
                  style: R.textStyle.inter_semibold_24_600.copyWith(color: R.color.app_color),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  R.strings.description_onboard,
                  style: R.textStyle.inter_medium_16_500
                      .copyWith(color: R.color.textDescriptionFeddBack),
                ),
                SizedBox(
                  height: 40,
                ),
                Image.asset(R.drawables.img_on_board),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ButtonWithIconWidget(
                    isRightToLeft: true,
                    iconColor: R.color.white,
                    radius: 10,
                    onPressed: _navigateChatPage,
                    title: R.strings.chat_with_AI_now,
                    iconAsset: R.drawables.Arrow_right,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _skipOnboardingPage () {
    _bloc.add(EventSkipOnboarding());
  }

  void _navigateChatPage() {
    _bloc.add(EventGotoScerrenChat());
  }
}
