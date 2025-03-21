import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/register_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class RegisterBloc extends BaseBloc<PageAction , PageEvent , PageState> {
  final _registerUseCase = GetIt.I<RegisterUsecase> ();
  RegisterBloc() : super (PageState()) {
    on<EventShowPassword> (_handleEventShowPassword);
    on<EventShowConfirmPassword>(_handleEventShowConfirmPassword);
    on<EventSaveFullNameUser> (_handleEventSaveFullNameUser);
    on<EventSaveConfirmPassword> (_handleEventSaveConfirmPassword);
    on<EventSaveEmailUser>(_handleEventSaveEmailUser);
    on<EventSaveGenderUser>(_handleEventSaveGenderUser);
    on<EventSaveOccupationlUser>(_handleEventSaveOccupationlUser);
    on<EventSavebirthdaylUser>(_handleEventSavebirthdaylUser);
    on<EventSavephonelUser>(_handleEventSavephonelUser);
    on<EventSavehobbieslUser>(_handleEventSavehobbieslUser);
    on<EventSignUp>(_handleEventSignUp);
    on<EventNavigateSignUp> (_handleEventNavigateSignUp);
  }

  Future<void> _handleEventShowPassword ( EventShowPassword event, Emitter<PageState> emit) async {
     emit(state.copyWith(dontShowpassword: state.showPassword));
  }

   Future<void> _handleEventShowConfirmPassword ( EventShowConfirmPassword event, Emitter<PageState> emit) async {
     emit(state.copyWith(dontShowConfirmPassword: state.showConfirmPassword));
  }

  Future<void> _handleEventSaveFullNameUser ( EventSaveFullNameUser event, Emitter<PageState> emit) async {
     emit(state.copyWith(fullName:  event.fullName));
  }

   Future<void> _handleEventSaveConfirmPassword ( EventSaveConfirmPassword event, Emitter<PageState> emit) async {
     emit(state.copyWith(conFirmPassword:  event.confirmPassword));
  }

   Future<void> _handleEventSaveEmailUser ( EventSaveEmailUser event, Emitter<PageState> emit) async {
     emit(state.copyWith(email:  event.email));
  }

   Future<void> _handleEventSaveGenderUser ( EventSaveGenderUser event, Emitter<PageState> emit) async {
     emit(state.copyWith(gender:  event.gender));
  }

   Future<void> _handleEventSaveOccupationlUser ( EventSaveOccupationlUser event, Emitter<PageState> emit) async {
     emit(state.copyWith(occupation:  event.occupation));
  }
  
  Future<void> _handleEventSavebirthdaylUser ( EventSavebirthdaylUser event, Emitter<PageState> emit) async {
     emit(state.copyWith(dateOfBirthd:  event.birthDay));
  }
  
  Future<void> _handleEventSavephonelUser ( EventSavephonelUser event, Emitter<PageState> emit) async {
     emit(state.copyWith(phoneNumber:  event.phoneNumber));
  }
  
   Future<void> _handleEventSavehobbieslUser( EventSavehobbieslUser event, Emitter<PageState> emit) async {
     emit(state.copyWith(hobbies:  event.hobbies));
  }
  
   Future<void> _handleEventSignUp ( EventSignUp event, Emitter<PageState> emit) async {
     emit(state.copyWith(showloading:  true));
     final result = await _registerUseCase.call((birthDay:  state.dateOfBirthd , email:  state.email , fullName: state.fullName , gender: state.gender , hobbies: state.hobbies , occupation: state.occupation , password: state.conFirmPassword , phone: state.phoneNumber));

    await result.when(success: (data) {
      addAction(SignUpSuccess());
    }, failure: (error) {
      addAction(SignUpFailed(errorMessage: error.errorMessage));
    }).whenComplete(() => emit(state.copyWith(showloading: false)));
  }
  
  Future<void> _handleEventNavigateSignUp (EventNavigateSignUp event , Emitter<PageState> emit) async {
    addAction(NavigateSignUpPage());
  }
}