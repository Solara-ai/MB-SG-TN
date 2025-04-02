import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/model/epic.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/epic/delete_epic_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/epic/getListEpic_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage/model/task_manage_tab.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class TaskManageTabBloc extends BaseBloc<PageAction, PageEvent, PageState> {
  final DeleteEpicUsecase _deleteEpicUsecase = GetIt.I<DeleteEpicUsecase>();
  final GetlistEpicUsecase _getlistEpicUsecase = GetIt.I<GetlistEpicUsecase>();
  final TaskManageTab tab;
  TaskManageTabBloc({required this.tab}) : super(PageState()) {
    on<EventLoadedListEpic>(_handleEventLoaddedListEpic);
    on<EventNavigateDetailEpic>(_handleEventNavigateDetailPage);
    on<EventUserSelectEpicId>(_handleUserSelectEpicId);
    on<EventDeleteEpic>(_deleteEpic);
  }

  

  Future<void> _handleEventLoaddedListEpic(EventLoadedListEpic event, Emitter emit) async {
    emit(state.copyWith(showLoading: true));
    final result = await _getlistEpicUsecase.call((type: tab.value));
    result.when(
      success: (data) {
        emit(state.copyWith(epicList: data, showLoading: false));
      },
      failure: (error) {
        emit(state.copyWith(showLoading: false));
      },
    );
  }

  Future<void> _handleEventNavigateDetailPage (EventNavigateDetailEpic event , Emitter emit) async {
    addAction(ActionNavigateDetailEpic(epic:  event.epic));
  }

  Future<void> _handleUserSelectEpicId (EventUserSelectEpicId event , Emitter emit) async{
      emit(state.copyWith(epicId: event.epicId));
  }

  Future<void> _deleteEpic (EventDeleteEpic event , Emitter emit) async{
     emit(state.copyWith(showLoading: true));
     final result = await _deleteEpicUsecase.call((epicId: state.epicId));
     result.when(success: (data) {
       emit(state.copyWith(showLoading: false));
       addAction(ActionDeleteEpicSuccess());
     }, failure: (error){

     });
  }
}
