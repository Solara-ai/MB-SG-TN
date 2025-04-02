import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/model/epic.dart';
import 'package:schedule_gen_and_time_management/domain/model/list_task.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/epic/detail_epic_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/task/delete_task_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/task/get_list_task_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class DetailEpicBloc extends BaseBloc<PageAction , PageEvent , PageState> {
  final Epic epic;
  final DetailEpicUsecase _detailEpicUsecase = GetIt.I<DetailEpicUsecase>();
  final DeleteTaskUsecase _deleteTaskUsecase = GetIt.I<DeleteTaskUsecase>();
  final GetListTaskUsecase _listTaskUsecase = GetIt.I<GetListTaskUsecase>(); 
  DetailEpicBloc({required this.epic}) : super(PageState()) {
    on<EventLoadDetailEpic>(_onLoadDetailEpic);
    on<EventLoadListTask>(_onLoadListTask);
    on<EventNavigateAddTask>(_handleEventNavigateAddTask);
    on<EventUserSelectTaskId>(_handleUserSelectIdTask);
    on<EventDeleteTask> (_deleteTask);
    _loadDetailEpic();
    _loadListTask();
  }

  void _loadDetailEpic() {
    add(EventLoadDetailEpic());
  }

  void _loadListTask() {
    add(EventLoadListTask());
  }


  Future<void> _onLoadDetailEpic(EventLoadDetailEpic event, Emitter emit) async {
    emit(state.copyWith(showLoading: true));
    final result = await _detailEpicUsecase.call((epicId: epic.id));
    result.when(
      success: (data) {
        emit(state.copyWith(epic: data, showLoading: false));
      },
      failure: (error) {
        emit(state.copyWith(showLoading: false));
        addAction(ActionLoaddedDetailEpicFailed(message: error.errorMessage));
      },
    );
  }

  Future<void> _handleEventNavigateAddTask(EventNavigateAddTask event, Emitter emit) async {
    addAction(ActionNavigateAddTask());
  }

 Future <void> _onLoadListTask(EventLoadListTask event, Emitter emit) async {
    emit(state.copyWith(showLoading: true));
    final result = await _listTaskUsecase.call((epicId: epic.id));
    result.when(
      success: (data) {
        emit(state.copyWith(listTask: data, showLoading: false));
      },
      failure: (error) {
        emit(state.copyWith(showLoading: false));
        addAction(ActionLoadedListTaskFailed(message: error.errorMessage));
      },
    );
  }

  Future<void> _handleUserSelectIdTask (EventUserSelectTaskId event , Emitter emit) async{
    emit(state.copyWith(idTask: event.id));
  }

  Future<void> _deleteTask (EventDeleteTask event , Emitter emit) async{
    emit(state.copyWith(showLoading: true));
    final result = await _deleteTaskUsecase.call((epicId: epic.id , taskId: state.idTask));
    result.when(success: (data){ 
      emit(state.copyWith(showLoading: false));
      addAction(ActionDeleteTaskSuccess());
    }, failure: (error) {
    });
  }  

}