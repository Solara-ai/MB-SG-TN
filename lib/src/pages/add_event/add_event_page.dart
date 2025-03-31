import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/domain/model/category.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/add_category/add_category_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/add_event/add_event_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/add_event/model/repeat.dart';
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

class AddEventPage extends BasePage {
  const AddEventPage({super.key});
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends BaseState<AddEventPage> {
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  late AddEventBloc _bloc;

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    _setupBloc();
    super.initState();
  }

  void _setupBloc() {
    _bloc = AddEventBloc();
    _bloc.listenAction(cancelSubOnDispose, (action) {
      switch (action) {
        case ActionAddEventSuccess():
          ToastUtils.showSuccessToast(context, message: R.strings.add_Event_success);
          popPage(result: true);
        case ActionAddEventFaild():
          ToastUtils.showErrorToast(context, message: action.message);
        case ActionLoadedFaild():
          ToastUtils.showErrorToast(context, message: action.message);
        case ActionNavigateAddCategory() :
          popPage();
          NavigatorUltils.navigatePage(context, AddCategoryPage());
      }
    });
  }

   final DropDownController<Repeat> _dropDownControlleRepeat =
      DropDownController(initialItem: Repeat.NONE, initialItemList: Repeat.values);
  final DropDownController<Category> _dropDownControllerCategory =
      DropDownController(initialItemList: []);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEventBloc, PageState>(
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
                            R.strings.add_event,
                            style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.text),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        // event name
                        CommonTextFormField(
                          hintText: R.strings.event_name,
                          onSaved: (newValue) =>
                              _bloc.add(EventUserChangeNameEvent(name: newValue)),
                          validator: (value) =>
                              value.isNullOrEmpty() ? R.strings.please_enter_event : null,
                        ),
                        SizedBox(height: 12),
                        // DesCription
                        CommonTextFormField(
                          onSaved: (newValue) =>
                              _bloc.add(EventUserChangeDescription(desCription: newValue)),
                          hintText: R.strings.description,
                          validator: (value) => value.isNullOrEmpty()
                              ? R.strings.please_enter_description_event
                              : null,
                        ),
                        SizedBox(height: 12),
                        // Date
                        DateTimeFormFieldWidget(
                          hintText: R.strings.date,
                          onSaved: (date) => _bloc.add(EventUserChangeDate(date: date)),
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
                                onSavedItem: (value) =>
                                    _bloc.add(EventUserChangeRepeat(repeat: value?.value)),
                                initialItem: Repeat.NONE,
                                itemList: Repeat.values,
                                controller: _dropDownControlleRepeat,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        _buildSelectedCategory()
                      ],
                    ),
                  ),
                ),
                ButtonWithIconWidget(
                  onPressed: _addEvent,
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

  void _addEvent() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_compareTime(_startTime, _endTime) >= 0) {
        ShowBottomSheetWithIcon.showBottomSheetWithIcon(
            message: R.strings.start_time_must_be_less_than_end_time,
            context: context,
            icon: Icons.warning,
            colorIcon: R.color.colorErrorBase);
        return;
      }
      _bloc.add(EventChangeStartTime(startTime: _startTime));
      _bloc.add(EventChangeEndTime(endTime: _endTime));
      _bloc.add(EventAddEvent());
    }
  }

  Widget _buildSelectedCategory() {
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

  int _compareTime(TimeOfDay? t1, TimeOfDay? t2) {
    if (t1 == null || t2 == null) return -1; // Tránh lỗi null
    if (t1.hour < t2.hour) return -1;
    if (t1.hour > t2.hour) return 1;
    if (t1.minute < t2.minute) return -1;
    if (t1.minute > t2.minute) return 1;
    return 0;
  }
}