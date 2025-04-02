import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';
part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';
class TaskManageBloc extends BaseBloc<PageAction , PageEvent , PageState> {
    TaskManageBloc() : super (PageState()) {
      on<EventNavigateAddEpicPage>(_handleNavigatePageAction);
    }

  
    Future<void> _handleNavigatePageAction (EventNavigateAddEpicPage event , Emitter emit) async{
     addAction(ActionNavigateAddEpic());
    }
}