import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/domain/model/schedule_by_date.dart';
import 'package:schedule_gen_and_time_management/domain/model/schedule_data.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/add_event/add_event_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/base_scafold/base_scaffold_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/chat_bot/chat_bot_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/schedules/schedule_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/update_schedule/update_schedule_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/color_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/size_config.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/widgets/bottom%20sheet/bottom_sheet_widget.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/floating_action_button.dart';
import 'package:schedule_gen_and_time_management/src/widgets/loading/loading_overlay.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends BasePage {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends BaseState<SchedulePage> {
  late ScheduleBloc _bloc;

  List<ScheduleData> listScheduleData = [];

  @override
  void initState() {
    _setupBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _setupBloc() {
    _bloc = ScheduleBloc();
    _bloc.listenAction(cancelSubOnDispose, (action) async {
      switch (action) {
        case ActionNavigateChatAi():
          final result = await NavigatorUltils.navigatePage<bool>(context, ChatBotPage());
          if (result == true) {
            _bloc.add(EventInitilize());
            _bloc.add(EventGetListScheduleData());
          }
        case ActionLoaddedDataFaild():
          ToastUtils.showErrorToast(context, message: action.message);
        case ActionLoaddedDataListScheduleFaild():
          ToastUtils.showErrorToast(context, message: action.message);
        case ActionLoadedScheduleDataError():
          ToastUtils.showErrorToast(context, message: action.message);
        case ActionDeletedEventSuccess():
          ToastUtils.showSuccessToast(context, message: R.strings.deleted_event_success);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleBloc, PageState>(
      bloc: _bloc,
      builder: (context, state) {
        listScheduleData = state.listScheduleData ?? [];
        return LoadingOverlay(
          isLoading: state.showLoading,
          child: BaseScaffoldPage(
            appbar: AppBar(
              scrolledUnderElevation: 0,
              centerTitle: true,
              title: Text(R.strings.schedule,
                  style: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.text)),
              backgroundColor: R.color.white,
              actions: [
                GestureDetector(
                  onTap: () => _bloc.add(EventNavigateChatAi()),
                    child: Container(
                        alignment: Alignment.centerRight,
                        width: 100,
                        height: 70,
                        padding: EdgeInsets.only(right: 20),
                        child: Text(R.strings.chat_ai,
                            style: R.textStyle.inter_medium_14_500
                                .copyWith(color: R.color.itemToday))))
              ],
            ),
            body: _buildBody(state),
            floatingActionButton: buildFloatingButton(
              context: context,
              onPressed: () async {
                bool? result = await BottomSheetUtil.show<bool>(context,
                    child: AddEventPage(), maxHeight: SizeConfig.screenHeight * 0.85, radius: 32);
                if (result == true) {
                  _bloc.add(EventGetListScheduleData());
                  _bloc.add(EventInitilize());
                }
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(PageState state) {
    return Column(
      children: [
        _buildTableCalendar(state),
        SizedBox(
          height: 15,
        ),
        listScheduleData
                .where((schedule) => isSameDay(schedule.date.toDateTime(), state.selectedDate))
                .toList()
                .isEmpty
            ? Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(R.drawables.ic_empty_img_simple),
                      SizedBox(
                        height: 20,
                      ),
                      Text(R.strings.no_event_here,
                          style: R.textStyle.inter_light_14_300
                              .copyWith(color: R.color.colorTextDescription))
                    ],
                  ),
                ),
              )
            : state.listSchedulebydate == null || state.listSchedulebydate == []
                ? Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(R.drawables.ic_empty_img_simple),
                          SizedBox(
                            height: 20,
                          ),
                          Text(R.strings.no_event_here,
                              style: R.textStyle.inter_light_14_300
                                  .copyWith(color: R.color.colorTextDescription))
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 16,
                      ),
                      itemCount: state.listSchedulebydate!.length,
                      itemBuilder: (context, index) {
                        return _buildItemEvent(state.listSchedulebydate![index]);
                      },
                    ),
                  )
      ],
    );
  }

  Widget _buildTableCalendar(PageState state) {
    return TableCalendar(
      focusedDay: state.focusDate,
      firstDay: DateTime(1974),
      lastDay: DateTime(2099),
      calendarFormat: state.calendarFormat,
      onDaySelected: (selectedDay, focusedDay) {
        _bloc.add(EventChangeSelectedDate(selectedDate: selectedDay));
        _bloc.add(EventChangeFocusDate(focusDate: focusedDay));
        _bloc.add(EventGetListScheduleByDate());
      },
      onFormatChanged: (format) {
        _bloc.add(EventChangeCalendarFormat(calendarFormat: format));
      },
      selectedDayPredicate: (day) {
        return isSameDay(day, state.selectedDate);
      },
      onPageChanged: (focusDay) {
        _bloc.add(EventChangeFocusDate(focusDate: focusDay));
        _bloc.add(EventGetListScheduleData());
      },
      eventLoader: (day) {
        return state.listScheduleData
                ?.where((event) => isSameDay(event.date.toDateTime(), day))
                .toList() ??
            [];
      },
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, events) {
          final schedules = events.cast<ScheduleData>();
          List<String> listEventByschedule = schedules
              .expand((schedule) => schedule.categoryColor.map((categoryColor) => categoryColor))
              .toList();

          if (listEventByschedule.isNotEmpty) {
            return Positioned(
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listEventByschedule.take(3).map((event) {
                  return Container(
                    width: 5,
                    height: 5,
                    margin: EdgeInsets.symmetric(horizontal: 1.5),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: event.toColor()),
                  );
                }).toList(),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildItemEvent(ScheduleByDate schedule) {
    return GestureDetector(
      onTap: () async {
        bool? result = await BottomSheetUtil.show<bool>(context,
            child: UpdateSchedulePage(
              schedule: schedule,
            ),
            maxHeight: SizeConfig.screenHeight * 0.95,
            radius: 32);
        if (result == true) {
          _bloc.add(EventInitilize());
          _bloc.add(EventGetListScheduleData());
        }
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 96),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: R.color.item_event,
            border: Border.all(color: R.color.item_event),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buidColorItemEvent(schedule.categoryColor),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      '${schedule.startTime} - ${schedule.endTime}',
                      style: R.textStyle.inter_regular_12_400.copyWith(color: R.color.timeEvent),
                    ),
                  ), // ở đây có thể để ($startTime - $endTime)
                  GestureDetector(
                    onTap: () {
                      // thực hiện event lấy id cho vào state sau đó mơis gọi event xóa
                      _bloc.add(EventChangeEventId(eventId: schedule.eventId));
                      _bloc.add(EventDeleteSchedule());
                    },
                    behavior: HitTestBehavior.opaque,
                    child: SizedBox(
                      width: 40,
                      height: 20,
                      child: Text(
                        R.strings.delete,
                        style: R.textStyle.inter_regular_12_400.copyWith(
                            color: R.color.textStatusDone,
                            decoration: TextDecoration.underline,
                            decorationColor: R.color.textStatusDone),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              // Name event
              Text(
                schedule.eventName,
                style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.text),
              ),
              SizedBox(height: 3),
              // Description event
              Text(
                schedule.description,
                style: R.textStyle.inter_regular_12_400.copyWith(color: R.color.timeEvent),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buidColorItemEvent(String color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: R.color.item_event,
          border: Border.all(width: 3, color: color.toColor()),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
