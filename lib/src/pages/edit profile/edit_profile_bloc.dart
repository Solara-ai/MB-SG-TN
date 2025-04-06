import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/model/user_profile.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/user/get_profile_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/user/update_profile_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class EditProfileBloc extends BaseBloc<PageAction, PageEvent, PageState> {
  final GetProfileUsecase _getProfileUsecase = GetIt.I<GetProfileUsecase>();
  final UpdateProfileUsecase _updateProfileUsecase = GetIt.I<UpdateProfileUsecase>();
  EditProfileBloc() : super(PageState()) {
    on<EventInitilize>(_handleEventInitilize);
    on<EventUserChangeFullName>(_handleEventUserChangeFullName);
    on<EventUserChangePhone>(_handleEventUserChangePhone);
    on<EventUserChangeBirthDay>(_handleEventUserChangeBirthDay);
    on<EventUserChangeGender>(_handleEventUserChangeGender);
    on<EventUserChangeHobbies>(_handleEventUserChangeHobbies);
    on<EventUserChangePassword>(_handdleEventUserChangePassword);
    on<EventUserChangeoccupation>(_handleEventUserChangeoccupation);
    on<EventUserChangeEmail>(_handleEventUserChangeEmail);
    on<EventUpdateProfile>(_updateProfile);
    on<EventRequiredPaswordAgain>(_handleEventRequiredPasswordAgain);
    on<EventRequiredPassword>(_handleEventRequiredPassword);
    _eventInitilize();
  }

  void _eventInitilize() {
    add(EventInitilize());
  }

  Future<void> _handleEventInitilize(EventInitilize event, Emitter emit) async {
    emit(state.copyWith(showLoading: true));
    final result = await _getProfileUsecase.call(());
    result.when(success: (data) {
      emit(state.copyWith(showLoading: false, userprofile: data));
      emit (state.copyWith(birthDay: data.birthday.toDateTime()));
    }, failure: (error) {
      emit(state.copyWith(showLoading: false));
      addAction(ActionLoaddedProfileFaild(message: error.errorMessage));
    });
  }

  Future<void> _handleEventUserChangeFullName(EventUserChangeFullName event, Emitter emit) async {
    emit(state.copyWith(fullName: event.fullName));
  }

  Future<void> _handleEventUserChangePhone(EventUserChangePhone event, Emitter emit) async {
    emit(state.copyWith(phone: event.phone));
  }

  Future<void> _handleEventUserChangeBirthDay(EventUserChangeBirthDay event, Emitter emit) async {
    emit(state.copyWith(birthDay: event.birthDay));
  }

  Future<void> _handleEventUserChangeGender(EventUserChangeGender event, Emitter emit) async {
    emit(state.copyWith(gender: event.gender));
  }

  Future<void> _handleEventUserChangeHobbies(EventUserChangeHobbies event, Emitter emit) async {
    emit(state.copyWith(hobbies: event.hobbies));
  }

  Future<void> _handdleEventUserChangePassword(EventUserChangePassword event, Emitter emit) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _handleEventUserChangeEmail(EventUserChangeEmail event, Emitter emit) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _handleEventUserChangeoccupation(
      EventUserChangeoccupation event, Emitter emit) async {
    emit(state.copyWith(occupation: event.ocupation));
  }

  Future<void> _updateProfile(EventUpdateProfile event, Emitter emit) async {
    emit(state.copyWith(showLoading: true));
    final result = await _updateProfileUsecase.call((
      birthDay: state.birthDay,
      fullName: state.fullName,
      gender: state.gender,
      hobbies: state.hobbies,
      ocupation: state.occupation,
      password: state.password,
      phone: state.phone
    ));
    result.when(success: (data) {
      emit(state.copyWith(showLoading: false));
      addAction(ActionUpdateProfileSuccess());
    }, failure: (error) {
      emit(state.copyWith(showLoading: false));
      addAction(ActionUpdateProfileFaild(error: error.errorMessage));
    });
  }

  Future<void> _handleEventRequiredPasswordAgain (EventRequiredPaswordAgain event, Emitter emit) async{
    emit(state.copyWith(requiredPassword: true));
  }

  Future<void>  _handleEventRequiredPassword (EventRequiredPassword event , Emitter emit) async{
    emit(state.copyWith(requiredPasswordAgain: true));
  }
}
