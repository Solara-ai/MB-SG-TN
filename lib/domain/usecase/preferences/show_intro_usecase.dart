import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/repository/app_preferences.dart';

class ShowIntroUsecase {
    final AppPreferences _appPreferences = GetIt.I<AppPreferences>();

    bool get showIntro => _appPreferences.showIntro ?? true;

    Future<bool> successShowIntro () => _appPreferences.setShowIntro(false);
}