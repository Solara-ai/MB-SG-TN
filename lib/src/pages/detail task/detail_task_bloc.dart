import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/model/epic.dart';
import 'package:schedule_gen_and_time_management/domain/model/task.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/task/detai_task_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class DetailTaskBloc extends BaseBloc<PageAction, PageEvent, PageState> {
  final Task task;
  final Epic epic;
  final DetaiTaskUsecase _detaiTaskUsecase = GetIt.I<DetaiTaskUsecase>();
  DetailTaskBloc({required this.task, required this.epic}) : super(PageState()) {
    on<EventInitilize>(_handleEventInitilize);
    on<EventNavigateEditTask>(_handleEventNavigateEditTask);
    _initilize();
  }

  void _initilize() {
    add(EventInitilize());
  }

  Future<void> _handleEventInitilize(EventInitilize event, Emitter emit) async {
    emit(state.copyWith(showLoading: true));
    final result = await _detaiTaskUsecase.call((idTask: task.id, idepic: epic.id));
    result.when(
        success: (data) {
          emit(state.copyWith(
              showLoading: false,
              title: data.title,
              description: data.description,
              epicName: data.epicName,
              status: data.status));
        },
        failure: (error) {
          addAction(ActionLoaddedDataFaild(messsage: error.errorMessage));
        });
  }

  Future<void> _handleEventNavigateEditTask (EventNavigateEditTask event , Emitter emit) async{
    addAction(ActionNavigateEditTask());
  }
}
