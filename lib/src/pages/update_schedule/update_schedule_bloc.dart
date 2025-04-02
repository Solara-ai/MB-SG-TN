import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/model/category.dart';
import 'package:schedule_gen_and_time_management/domain/model/schedule_by_date.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/category/get_list_category_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/schedules/get_schedule_by_eventId_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/schedules/update_schedule_uscase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class UpdateScheduleBloc extends BaseBloc<PageAction, PageEvent, PageState> {
  final ScheduleByDate scheduleByDate;
  final GetListCategoryUsecase _getListCategoryUsecase = GetIt.I<GetListCategoryUsecase>();
  final GetScheduleByEventidUsecase _getScheduleByEventidUsecase =
      GetIt.I<GetScheduleByEventidUsecase>();
  final UpdateScheduleUscase _updateScheduleUscase = GetIt.I<UpdateScheduleUscase>();
  UpdateScheduleBloc({required this.scheduleByDate}) : super(PageState()) {
    on<EventInitilize>(_handleEventInitilize);
    on<EventUserChangeNameEvent>(_handleEventUserChangeNameEvent);
    on<EventUserChangeDescription>(_handleEventUserChangeDescription);
    on<EventUserChangeDate>(_handleEventUserChangeDate);
    on<EventUserChangeRepeat>(_handleEventUserChangeRepeat);
    on<EventChangeRemindMe>(_handleEventChangeRemindMe);
    on<EventChangeCategoryId>(_handleEventChangeCategoryId);
    on<EventChangeStartTime>(_handleEventChangeStartTime);
    on<EventChangeEndTime>(_handleEventChangeEndTime);
    on<EventChangeRepetEndDate>(_handleEventRepetEndtime);
    on<EventUpdateSchedule>(_handleEventUpdateSchedule);
    on<EventNavigateAddCategory>(_handleEventNavigateAddCategory);
    on<EventChangeUpdateType>(_handleEventChangeUpdateType);
    // on<EventChangeScheduleId> (_handleEventChangeScheduleId);
    on<EventLoadListCategory> (_handleEventLoadListCategory);
    _eventInitilize();
    _eventLoadedListCategory();
  }
  void _eventInitilize() {
    add(EventInitilize());
  }

  void _eventLoadedListCategory() {
    add(EventLoadListCategory());
  }

  Future<void> _handleEventInitilize(EventInitilize event, Emitter emit) async {
    emit(state.coppyWith(showLoading: true));
    final result = await _getScheduleByEventidUsecase.call((eventId: scheduleByDate.eventId));
    result.when(success: (data) {
      emit(state.coppyWith(
          name: data.eventName,
          description: data.description,
          date: data.date.toDateTime(),
          startTime: data.startTime.toTimeOfDay(),
          endTime: data.endTime.toTimeOfDay(),
          remindMe: data.remindMe,
          repeat: data.repeat,
          categor: data.categories,
          showLoading: false,
          eventId: data.eventId));
          print(  'date event itinize :  ${state.date}');
    }, failure: (error) {
      addAction(ActionLoaddedScheduleByEventIdFaild(message: error.errorMessage));
    });
  }
  Future<void> _handleEventLoadListCategory (EventLoadListCategory event , Emitter emit) async{
     final result = await _getListCategoryUsecase.call(());

    result.when(success: (data){
      emit(state.coppyWith(listCategory: data as List<Category>?));
    }, failure: (error){
      addAction(ActionLoadedListCategoryFaild( message:  error.errorMessage));
    });
  }
  Future<void> _handleEventUserChangeNameEvent(EventUserChangeNameEvent event, Emitter emit) async {
    emit(state.coppyWith(name: event.name));
  }

  Future<void> _handleEventUserChangeDescription(
      EventUserChangeDescription event, Emitter emit) async {
    emit(state.coppyWith(description: event.desCription));
  }

  Future<void> _handleEventUserChangeDate(EventUserChangeDate event, Emitter emit) async {
    emit(state.coppyWith(date: event.date));
  }

  Future<void> _handleEventUserChangeRepeat(EventUserChangeRepeat event, Emitter emit) async {
    emit(state.coppyWith(repeat: event.repeat));
  }

  Future<void> _handleEventChangeRemindMe(EventChangeRemindMe event, Emitter emit) async {
    emit(state.coppyWith(remindMe: event.remindMe));
  }

  Future<void> _handleEventChangeCategoryId(EventChangeCategoryId event, Emitter emit) async {
    emit(state.coppyWith(categoryId: event.categoryId));
  }

  Future<void> _handleEventChangeStartTime(EventChangeStartTime event, Emitter emit) async {
    emit(state.coppyWith(startTime: event.startTime));
  }

  Future<void> _handleEventChangeEndTime(EventChangeEndTime event, Emitter emit) async {
    emit(state.coppyWith(endTime: event.endTime));
  }

  Future<void> _handleEventRepetEndtime(EventChangeRepetEndDate event, Emitter emit) async {
    emit(state.coppyWith(repeatEnddate: event.repetEndDate));
  }

  Future<void> _handleEventUpdateSchedule(EventUpdateSchedule event, Emitter emit) async {
    final _result = await _updateScheduleUscase.call((
      categoryId: state.categoryId,
      date: state.date,
      description: state.description,
      endTime: state.endTime,
      eventId: state.eventId,
      name: state.name,
      repeat: state.repeat,
      remindMe: false,
      startTime: state.startTime,
      updateType: state.updateType,
      repeatEnddate: state.repeatEnddate,
      scheduleId: scheduleByDate.scheduleId
    ));
    _result.when(success: (
      data
    ) {
      addAction(ActionUpdateScheduleSuccess());
    }, failure: (error){
      addAction(ActionUpdateScheduleFaild(error.errorMessage));
    });
  }

  Future<void> _handleEventChangeUpdateType(EventChangeUpdateType event, Emitter emit) async {
    emit(state.coppyWith(updateType: event.updateType));
  }


  Future<void> _handleEventNavigateAddCategory(EventNavigateAddCategory event, Emitter emit) async {
    addAction(ActionNavigateAddCategory());
  }
}
