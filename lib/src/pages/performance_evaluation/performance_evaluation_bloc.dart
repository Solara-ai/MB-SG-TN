import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/model/evaluate_schedule.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/session_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/user/evaluate_schedule_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';


part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class PerformanceEvaluationBloc extends BaseBloc <PageAction , PageEvent , PageState> {
  final SessionUsecase _sessionUsecase = GetIt.I<SessionUsecase> ();
  final EvaluateScheduleUsecase _evaluateScheduleUsecase = GetIt.I<EvaluateScheduleUsecase>();
  PerformanceEvaluationBloc() : super (PageState()) {
    on<EventInitilize>(_handleEventInitilize);
    _eventInitilize();
  }


  void _eventInitilize () {
    add(EventInitilize());
  }


  Future<void> _handleEventInitilize (EventInitilize event , Emitter emit) async{
    emit(state.copyWith(showLoading: true));
    final result = await _evaluateScheduleUsecase.call((userId: _sessionUsecase.userId ?? ''));
    result.when(success: (data) {
      emit (state.copyWith(showLoading: false , evaluateSchedule: data));
    }, failure: (error){
      emit(state.copyWith(showLoading: false));
      addAction(ActionLoaddataFaild(message: error.errorMessage));
    });  
  }

}