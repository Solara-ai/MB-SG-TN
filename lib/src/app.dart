import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/session_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/preferences/show_intro_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/auth/auth_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/home/home_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/onboarding/on_boarding_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/start/start_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/size_config.dart';

class App extends BasePage {
  const App({super.key});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends BaseState<App> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
          BlocProvider(create: (context) => AuthBloc()),
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: _navigatorKey,
          builder: (context, child) {
            SizeConfig.init(context);
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
                child: FToastBuilder()(context, child));
          },
          home: BlocBuilder<AuthBloc , AuthState>( builder: (context , state) => getStartPage(context , state)),
        ),
      ),
    );
  }

   Widget getStartPage(BuildContext context, AuthState authState) {
    ShowIntroUsecase showIntroUsecase = ShowIntroUsecase();
    SessionUsecase sessionUsecase = SessionUsecase();
    if (!sessionUsecase.isLoggedIn) {
      return StartPage();
    }
    else {
        if (showIntroUsecase.showIntro == true)
        {
          return OnBoardingPage();
        }
        else {
          return HomePage();
        }
    }
  }
}
