import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
// import 'package:schedule_gen_and_time_management/src/pages/add%20task/add_task_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/auth/auth_bloc.dart';
// import 'package:schedule_gen_and_time_management/src/pages/create%20new%20plan/create_new_plan_page.dart';
// import 'package:schedule_gen_and_time_management/src/pages/detail%20epic/detail_epic_page.dart';
// import 'package:schedule_gen_and_time_management/src/pages/detail%20task/detail_task_page.dart';
// import 'package:schedule_gen_and_time_management/src/pages/edit%20epic/edit_epic_page.dart';
// import 'package:schedule_gen_and_time_management/src/pages/fedd%20back/feed_back_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/home/home_page.dart';
// import 'package:schedule_gen_and_time_management/src/pages/login/login_page.dart';
// import 'package:schedule_gen_and_time_management/src/pages/plan%20todo/plan_to_do_page.dart';
// import 'package:schedule_gen_and_time_management/src/pages/profile/proflie_page.dart';
// import 'package:schedule_gen_and_time_management/src/pages/register/register_page.dart';
// import 'package:schedule_gen_and_time_management/src/pages/settings/settings_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/start/start_page.dart';
// import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/task_manage_tab_page.dart';
// import 'package:schedule_gen_and_time_management/src/pages/task%20manage/task_manage_page.dart';
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
          home: BlocBuilder<AuthBloc , AuthState>(builder: (context , state) => getStartPage(context , state)),
        ),
      ),
    );
  }

   Widget getStartPage(BuildContext context, AuthState authState) {
    if (!authState.isLoggedIn) {
      return StartPage();
    }
    return HomePage();
  }
}
