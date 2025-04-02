import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/model/epic.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/task/create_task_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class AddTaskBloc extends BaseBloc<PageAction , PageEvent , PageState> {
  final Epic epic;
  final CreateTaskUsecase _createTaskUsecase = GetIt.I<CreateTaskUsecase>();
    AddTaskBloc ({required this.epic}) : super (PageState()) {
      on<EventUserChangeDescriptionTask>(_handleEventUserChangeDescription);
      on<EventUserChangeTitleTask>(_handleEventUserChangeTitle);
      on<EventAddTask>(_handleEventAddTask);
    }

    Future<void> _handleEventUserChangeTitle (EventUserChangeTitleTask event , Emitter emit) async{
        emit(state.copyWith(title: event.title));
    }

    Future<void> _handleEventUserChangeDescription (EventUserChangeDescriptionTask event , Emitter emit) async{
        emit(state.copyWith(description: event.description));
    }

    Future<void> _handleEventAddTask (EventAddTask event , Emitter emit) async{
        final result = await _createTaskUsecase((epicId: epic.id, title: state.title, description: state.description));
        result.when(
          success: (data) {
            addAction(ActionAddTaskSuccess());
          },
          failure: (error) {
            addAction(ActionAddTaskFaild(error.errorMessage));
          },
        );
    }


}