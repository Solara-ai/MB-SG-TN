import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/model/schedule_by_date.dart';
import 'package:schedule_gen_and_time_management/domain/model/schedule_data.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/schedules/deleted_schedule_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/schedules/get_list_schedule_by_date_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/schedules/get_list_schedule_data_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

part 'bloc/page_state.dart';
part 'bloc/page_event.dart';
part 'bloc/page_action.dart';

class ScheduleBloc extends BaseBloc<PageAction, PageEvent, PageState> {
  final GetListScheduleByDateUsecase _getListScheduleByDateUsecase =
      GetIt.I<GetListScheduleByDateUsecase>();
  final GetListScheduleDataUsecase _getListScheduleDataUsecase =
      GetIt.I<GetListScheduleDataUsecase>();
  final DeletedScheduleUsecase _deletedScheduleUsecase = GetIt.I<DeletedScheduleUsecase>();
  ScheduleBloc() : super(PageState()) {
    on<EventChangeSelectedDate>(_handleEventSlectedDate);
    on<EventChangeFocusDate>(_handleEventChangeFocusDate);
    on<EventInitilize>(_handleEventInitilize);
    on<EventChangeCalendarFormat>(_handleEventChangeCalendarFormat);
    on<EventGetListScheduleByDate>(_handleEventGetListScheduleByDate);
    on<EventGetListScheduleData>(_handleEventGetListScheduleData);
    on<EventChangeEventId>(_handleEventChangeEventId);
    on<EventDeleteSchedule>(_handleEventDeleteSchedule);
    on<EventNavigateChatAi>(_handleEventNavigateChatAi);
    _eventInitilize();
    _eventGetListScheduleData();
  }

  void _eventGetListScheduleData() {
    add(EventGetListScheduleData());
  }

  void _eventInitilize() {
    add(EventInitilize());
  }

  Future<void> _handleEventGetListScheduleData(EventGetListScheduleData event, Emitter emit) async {
    emit(state.copyWith(showLoading: true));
    final result = await _getListScheduleDataUsecase
        .call((month: state.focusDate.month, year: state.focusDate.year));
    result.when(success: (data) {
      emit(state.copyWith(listScheduleData: data, showLoading: false));
    }, failure: (error) {
      emit(state.copyWith(showLoading: false));
      addAction(ActionLoadedScheduleDataError(message: error.errorMessage));
    });
  }

  Future<void> _handleEventDeleteSchedule(EventDeleteSchedule event, Emitter emit) async {
    final result = await _deletedScheduleUsecase.call((eventId: state.eventId));
    result.when(success: (data) {}, failure: (error) {});
    _eventInitilize();
    _eventGetListScheduleData();
    addAction(ActionDeletedEventSuccess());
  }

  Future<void> _handleEventChangeEventId(EventChangeEventId event, Emitter emit) async {
    emit(state.copyWith(eventId: event.eventId));
  }

  Future<void> _handleEventInitilize(EventInitilize event, Emitter emit) async {
    emit(state.copyWith(showLoading: true));
    final result = await _getListScheduleByDateUsecase.call((date: state.selectedDate,));
    result.when(success: (data) {
      emit(state.copyWith(listSchedulebydate: data, showLoading: false));
    }, failure: (error) {
      emit(state.copyWith(showLoading: false));
      addAction(ActionLoaddedDataFaild(message: error.errorMessage));
    });
  }

  Future<void> _handleEventChangeCalendarFormat(
      EventChangeCalendarFormat event, Emitter emit) async {
    emit(state.copyWith(calendarFormat: event.calendarFormat));
  }

  Future<void> _handleEventSlectedDate(EventChangeSelectedDate event, Emitter emit) async {
    emit(state.copyWith(selectedDate: event.selectedDate));
  }

  Future<void> _handleEventChangeFocusDate(EventChangeFocusDate event, Emitter emit) async {
    emit(state.copyWith(focusDate: event.focusDate));
  }

  Future<void> _handleEventGetListScheduleByDate(
      EventGetListScheduleByDate event, Emitter emit) async {
    final result = await _getListScheduleByDateUsecase.call((date: state.selectedDate));
    result.when(success: (data) {
      emit(state.copyWith(listSchedulebydate: data));
    }, failure: (error) {
      addAction(ActionLoaddedDataFaild(message: error.errorMessage));
    });
  }

  Future<void> _handleEventNavigateChatAi(EventNavigateChatAi event, Emitter emit) async {
    addAction(ActionNavigateChatAi());
  }
}
