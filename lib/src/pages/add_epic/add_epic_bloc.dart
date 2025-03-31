import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/epic/create_epic_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class AddEpicBloc extends BaseBloc<PageAction , PageEvent , PageState> {
  final CreateEpicUsecase _createEpicUsecase = GetIt.I<CreateEpicUsecase>();

  AddEpicBloc() : super (PageState()) {
    on<EventAddEpic>(_handleEventAddEpic);
    on<EventChangeDescriptionEpic>(_handleEventChangeDescriptionEpic);
    on<EventChangeEpicName>(_handleEventChangeEpicName);
    on<EventChangeTypeNameEpic> (_handleEventChangeTypeName);
  }

  Future<void> _handleEventChangeDescriptionEpic (EventChangeDescriptionEpic event , Emitter emit) async{
    emit(state.copyWith(description: event.descriptionEpic));
  }

  Future<void> _handleEventChangeEpicName (EventChangeEpicName event , Emitter emit) async{
    emit(state.copyWith(name : event.epicname));
  }
  
  Future<void> _handleEventChangeTypeName (EventChangeTypeNameEpic event , Emitter emit) async{
    emit(state.copyWith(type: event.typeNameEpic));
  }

  Future<void> _handleEventAddEpic (EventAddEpic event , Emitter emit) async{
    emit(state.copyWith(showloading: true));
    final result = await _createEpicUsecase.call((description: state.description , name:  state.name , type: state.type));
    result.when(success: (data) {
      emit(state.copyWith(showloading: false));
      addAction(AddEpicSuccess());
    }, failure: (error){
      addAction(AddEpicFaild(message: error.errorMessage));
    }); 
  }
}