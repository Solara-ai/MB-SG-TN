import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/model/category.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/category/get_list_category_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/schedules/create_schedule_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class AddEventBloc extends BaseBloc <PageAction , PageEvent , PageState> {
  final GetListCategoryUsecase _getListCategoryUsecase = GetIt.I<GetListCategoryUsecase>();
  final CreateScheduleUsecase _createScheduleUsecase = GetIt.I<CreateScheduleUsecase>();
  AddEventBloc() : super (PageState()) {
    on<EventInitilize>(_handleEventInitilize);
    on<EventUserChangeNameEvent> (_handleEventUserChangeNameEvent);
    on<EventUserChangeDescription>(_handleEventUserChangeDescription);
    on<EventUserChangeDate>(_handleEventUserChangeDate);
    on<EventUserChangeRepeat>(_handleEventUserChangeRepeat);
    on<EventChangeRemindMe>(_handleEventChangeRemindMe);
    on<EventChangeCategoryId>(_handleEventChangeCategoryId);
    on<EventChangeStartTime>(_handleEventChangeStartTime);
    on<EventChangeEndTime>(_handleEventChangeEndTime);
    on<EventChangeRepetEndDate>(_handleEventRepetEndtime);
    on<EventAddEvent>(_handleEventAddEvent);
    on<EventNavigateAddCategory> (_handleEventNavigateCategory);
    _eventInitilize();
  }

  void _eventInitilize () {
    add(EventInitilize());
  }

  Future<void> _handleEventInitilize (EventInitilize event , Emitter emit) async{
    final result = await _getListCategoryUsecase.call(());

    result.when(success: (data){
      emit(state.coppyWith(listCategory: data as List<Category>?));
    }, failure: (error){
      addAction(ActionLoadedFaild(error.errorMessage));
    });
  }

  Future<void> _handleEventUserChangeNameEvent (EventUserChangeNameEvent event , Emitter emit) async{
    emit(state.coppyWith(name: event.name));
  }

  Future<void> _handleEventUserChangeDescription (EventUserChangeDescription event , Emitter emit) async{
      emit(state.coppyWith(description: event.desCription));
  }

  Future<void> _handleEventUserChangeDate (EventUserChangeDate event , Emitter emit) async{
      emit(state.coppyWith(date:  event.date));
  }

  Future<void> _handleEventUserChangeRepeat (EventUserChangeRepeat event , Emitter emit ) async{
      emit(state.coppyWith(repeat: event.repeat));
  }

  Future<void> _handleEventChangeRemindMe (EventChangeRemindMe event , Emitter emit) async{
    emit(state.coppyWith(remindMe: event.remindMe));
  }

  Future<void> _handleEventChangeCategoryId (EventChangeCategoryId event , Emitter emit) async{
    emit(state.coppyWith(categoryId: event.categoryId));
  }

  Future<void> _handleEventChangeStartTime (EventChangeStartTime event , Emitter emit) async{
    emit(state.coppyWith(startTime: event.startTime));
  }

  Future<void> _handleEventChangeEndTime (EventChangeEndTime event , Emitter emit) async{
    emit(state.coppyWith(endTime: event.endTime));
  }

  Future<void> _handleEventRepetEndtime (EventChangeRepetEndDate event , Emitter emit) async{
    emit(state.coppyWith(repeatEnddate: event.repetEndDate));
  }

  Future<void> _handleEventAddEvent (EventAddEvent event , Emitter emit) async{
    
    final result = await _createScheduleUsecase.call((categoryId: state.categoryId , date: state.date , description: state.description , endTime: state.endTime, startTime: state.startTime , remindMe: state.remindMe , repeat: state.repeat , repeatEndDate: state.repeatEnddate , name: state.name ));
    result.when(success: (data){
      print('success');
      addAction(ActionAddEventSuccess());
    }, failure: (error){
      addAction(ActionAddEventFaild(error.errorMessage));
    });
  }

  Future<void> _handleEventNavigateCategory (EventNavigateAddCategory event , Emitter emit ) async{
    addAction(ActionNavigateAddCategory());
  }
}