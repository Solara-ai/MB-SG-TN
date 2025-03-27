
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/model/user_profile.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/user/get_profile_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';
part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class ProfileBloc extends BaseBloc<PageAction , PageEvent , PageState> {
  final GetProfileUsecase _getProfileUsecase = GetIt.I<GetProfileUsecase>();
  ProfileBloc() : super (PageState()) {
    on<InitilizeEvent>(_hanDleInitilize);
    on<EventNavigateEditProfilePage>(_hanDleEventNavigateEditProfilePage);
    _initilize();
  }

  void _initilize() {
    add(InitilizeEvent());
  }

  Future<void> _hanDleInitilize (InitilizeEvent event , Emitter emit) async{
    final result = await _getProfileUsecase.call(());
    result.when(success: (data){
      emit(state.copyWith(userProfile: data));
    }, failure:(error){
        addAction(ActionGetMyprofileError(error.errorMessage));
    });
  }

  Future<void> _hanDleEventNavigateEditProfilePage (EventNavigateEditProfilePage event , Emitter emit) async{
    addAction(ActionNavigateProFilePage());
  }

}