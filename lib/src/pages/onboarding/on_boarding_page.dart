import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/session_usecase.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/chat_bot/chat_bot_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';

class OnBoardingPage extends BasePage {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends BaseState<OnBoardingPage> {
  final SessionUsecase _sessionUsecase = GetIt.I<SessionUsecase>(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: () {
                    NavigatorUltils.navigatePage(context, ChatBotPage());
                  },
                  title: R.strings.chat_with_AI_now,
                  iconAsset: R.drawables.Arrow_right,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
