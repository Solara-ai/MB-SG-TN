import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/domain/model/category.dart';
import 'package:schedule_gen_and_time_management/domain/model/schedule_by_date.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/add_category/add_category_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/add_event/model/repeat.dart';
import 'package:schedule_gen_and_time_management/src/pages/update_schedule/update_schedule_bloc.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/drop_down_controller_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/widgets/bottom%20sheet/show_bottom_sheet_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/date_time_form_field.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/time_form_filed_widget.dart';

class UpdateSchedulePage extends BasePage {
  final ScheduleByDate schedule;
  const UpdateSchedulePage({super.key, required this.schedule});
  @override
  _UpdateSchedulePageState createState() => _UpdateSchedulePageState();
}

class _UpdateSchedulePageState extends BaseState<UpdateSchedulePage> {
  late final UpdateScheduleBloc _bloc;
  final _formKey = GlobalKey<FormState>();
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  late final DropDownController<Repeat> _dropDownControlleRepeat =
      DropDownController<Repeat>(initialItemList: Repeat.values);
  final DropDownController<Category> _dropDownControllerCategory =
      DropDownController(initialItemList: []);

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
    _bloc = UpdateScheduleBloc(scheduleByDate: widget.schedule);
    _bloc.listenAction(cancelSubOnDispose, (action) {
      switch (action) {
        case ActionLoaddedScheduleByEventIdFaild():
          ToastUtils.showErrorToast(context, message: action.message);
        case ActionUpdateScheduleFaild():
          ToastUtils.showErrorToast(context, message: action.message);
        case ActionUpdateScheduleSuccess():
          ToastUtils.showSuccessToast(context, message: R.strings.update_schedule_success);
          popPage(result: true);
        case ActionNavigateAddCategory():
          popPage();
          NavigatorUltils.navigatePage(context, AddCategoryPage());
        case ActionLoadedListCategoryFaild():
          ToastUtils.showErrorToast(context, message: action.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateScheduleBloc, PageState>(
      bloc: _bloc,
      builder: (context, state) {
        _dropDownControllerCategory.updateItemList(state.listCategory);
        return StatefulBuilder(
          builder: (context, setState) => Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CommonForm(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            R.strings.update_event,
                            style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.text),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        // event name
                        CommonTextFormField(
                          initialValue: state.name,
                          hintText: R.strings.event_name,
                          onSaved: (newValue) {
                            _bloc.add(EventUserChangeNameEvent(name: newValue));
                          },
                          validator: (value) =>
                              value.isNullOrEmpty() ? R.strings.please_enter_event : null,
                        ),
                        SizedBox(height: 12),
                        // DesCription
                        CommonTextFormField(
                          initialValue: state.description,
                          onSaved: (newValue) {
                            _bloc.add(EventUserChangeDescription(desCription: newValue));
                          },
                          hintText: R.strings.description,
                          validator: (value) => value.isNullOrEmpty()
                              ? R.strings.please_enter_description_event
                              : null,
                        ),
                        SizedBox(height: 12),
                        // Date
                        DateTimeFormFieldWidget(
                          initialDate: state.date,
                          hintText: R.strings.date,
                          onSaved: (value) {
                            _bloc.add(EventUserChangeDate(date: value));
                          },
                          // ,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2090),
                        ),
                        SizedBox(height: 12),
                        // Time
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 181,
                              child: TimeFormFieldWidget(
                                initialTime: state.startTime,
                                onChanged: (time) {
                                  setState(() {
                                    if (_endTime != null && _compareTime(time, _endTime!) >= 0) {
                                      ShowBottomSheetWithIcon.showBottomSheetWithIcon(
                                          message: R.strings.start_time_must_be_less_than_end_time,
                                          context: context,
                                          icon: Icons.warning,
                                          colorIcon: R.color.colorErrorBase);
                                      _startTime = time; // Chỉ cập nhật nếu hợp lệ
                                    } else {
                                      _startTime = time; // Chỉ cập nhật nếu hợp lệ
                                    }
                                  });
                                },
                                validator: (value) =>
                                    value == null ? R.strings.time_start_required : null,
                                onSaved: (time) {},
                                hintText: R.strings.start_time,
                              ),
                            ),
                            // End Time
                            SizedBox(
                              width: 181,
                              child: TimeFormFieldWidget(
                                initialTime: state.endTime,
                                onChanged: (time) {
                                  setState(() {
                                    if (_startTime != null &&
                                        _compareTime(_startTime!, time) >= 0) {
                                      ShowBottomSheetWithIcon.showBottomSheetWithIcon(
                                          message: R.strings.start_time_must_be_less_than_end_time,
                                          context: context,
                                          icon: Icons.warning,
                                          colorIcon: R.color.colorErrorBase);
                                      _endTime = time;
                                    } else {
                                      _endTime = time;
                                    }
                                  });
                                },
                                validator: (value) =>
                                    value == null ? R.strings.time_end_required : null,
                                onSaved: (time) {},
                                hintText: R.strings.end_time,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        // Remind me
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                R.strings.remindMe,
                                style: R.textStyle.inter_regular_16_400
                                    .copyWith(color: R.color.timeEvent),
                              ),
                            ),
                            CupertinoSwitch(
                              activeColor: R.color.item_event,
                              value: state.remindMe,
                              onChanged: (value) {
                                _bloc.add(EventChangeRemindMe(remindMe: value));
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // repeat
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                R.strings.repet,
                                style: R.textStyle.inter_regular_16_400
                                    .copyWith(color: R.color.timeEvent),
                              ),
                            ),
                            SizedBox(
                              width: 165,
                              child: DropdownFormField<Repeat>(
                                onSavedItem: (value) {
                                  _bloc.add(EventUserChangeRepeat(repeat: value?.value));
                                },
                                initialItem: _stringToRepeat(state.repeat),
                                itemList: Repeat.values,
                                controller: _dropDownControlleRepeat,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        _buildSelectedCategory(state)
                      ],
                    ),
                  ),
                ),
                ButtonWithIconWidget(
                  onPressed: _updateSchedule,
                  title: R.strings.submit,
                  radius: 10,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectedCategory(PageState state) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        color: R.color.white,
        border: Border.all(color: R.color.colorTextDescription),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownFormField(
            initialItem: state.category,
            controller: _dropDownControllerCategory,
            label: R.strings.select_category,
            isRequired: true,
            labelStyle: R.textStyle.inter_regular_16_400.copyWith(color: R.color.timeEvent),
            hintText: R.strings.select_category,
            onSavedItem: (value) => _bloc.add(EventChangeCategoryId(categoryId: value!.value)),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 150,
            height: 30,
            child: GestureDetector(
              onTap: () => _bloc.add(EventNavigateAddCategory()),
              child: Text(
                R.strings.add_new_category,
                style: R.textStyle.inter_regular_12_400.copyWith(color: R.color.addCategoryColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _updateSchedule() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_compareTime(_startTime, _endTime) >= 0) {
        ShowBottomSheetWithIcon.showBottomSheetWithIcon(
            message: R.strings.start_time_must_be_less_than_end_time,
            context: context,
            icon: Icons.warning,
            colorIcon: R.color.colorErrorBase);
        return;
      }
    }
    _bloc.add(EventChangeStartTime(startTime: _startTime));
    _bloc.add(EventChangeEndTime(endTime: _endTime));
    _bloc.add(EventUpdateSchedule());
  }

  int _compareTime(TimeOfDay? t1, TimeOfDay? t2) {
    if (t1 == null || t2 == null) return -1; // Tránh lỗi null
    if (t1.hour < t2.hour) return -1;
    if (t1.hour > t2.hour) return 1;
    if (t1.minute < t2.minute) return -1;
    if (t1.minute > t2.minute) return 1;
    return 0;
  }

  Repeat _stringToRepeat(String repeat) {
    if (repeat == Repeat.DAILY.value) {
      return Repeat.DAILY;
    } else if (repeat == Repeat.MONTHLY.value) {
      return Repeat.MONTHLY;
    } else if (repeat == Repeat.WEEKLY.value) {
      return Repeat.WEEKLY;
    } else if (repeat == Repeat.YEARLY.value) {
      return Repeat.YEARLY;
    } else {
      return Repeat.NONE;
    }
  }
}
