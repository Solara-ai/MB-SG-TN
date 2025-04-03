
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/model/user_profile.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/user/get_profile_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';
class EditProfileBloc extends BaseBloc<PageAction , PageEvent , PageState> {
  final GetProfileUsecase _getProfileUsecase = GetIt.I<GetProfileUsecase>();
  EditProfileBloc() :super (PageState()) {

  }

  // Future<void> _handleEventInitilize (EventInitilize event , Emitter emit ) async{
  //   emit(state.copyWith(showLoading: true));
  //   final result = await _getProfileUsecase.call(());
  //   result.when(success: () {}, failure: failure)
  // }
}