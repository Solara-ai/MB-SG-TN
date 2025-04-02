import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/model/schedule_by_date.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/epic/total_task_and_plan_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class HomeBloc extends BaseBloc<PageAction, PageEvent, PageState> {
  final TotalTaskAndPlanUsecase _totalTaskAndPlanUsecase = GetIt.I<TotalTaskAndPlanUsecase>();
  HomeBloc() : super(PageState()) {
    on<EventInitilize>(_handleEventInitilize);
    _eventInitilize();
  }

  void _eventInitilize() {
    add(EventInitilize());
  }

  Future<void> _handleEventInitilize(EventInitilize event, Emitter emit) async {
    emit(state.copyWith(showLoading: true));
    final result = await _totalTaskAndPlanUsecase.call((date: state.currentDate));
    result.when(success: (data) {
      emit(state.copyWith(
          showLoading: false,
          schedule: data.schedule,
          totalPlans: data.totalPlans,
          totalTask: data.totalTasks));
    }, failure: (error) {
      addAction(ActionLoaddedDataFaild(messsage: error.errorMessage));
    });
  }
}
