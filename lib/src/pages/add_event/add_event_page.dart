import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/domain/model/category.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/add_category/add_category_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/add_event/add_event_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/add_event/model/repeat.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/drop_down_controller_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/widgets/bottom%20sheet/show_bottom_sheet_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/dialogs/common_dialog.dart';
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
  DateTime? _selectedDate;
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
        case ActionGenEventAiSuccess():
          ToastUtils.showSuccessToast(context, message: 'Event Ai gen success');
        case ActionAddEventSuccess():
          ToastUtils.showSuccessToast(context, message: R.strings.add_Event_success);
          popPage(result: true);
        case ActionAddEventFaild():
          ToastUtils.showErrorToast(context, message: action.message);
        case ActionLoadedFaild():
          ToastUtils.showErrorToast(context, message: action.message);
        case ActionNavigateAddCategory():
          popPage();
          NavigatorUltils.navigatePage(context, AddCategoryPage());
      }
    });
  }

  final DropDownController<Repeat> _dropDownControlleRepeat =
      DropDownController(initialItem: Repeat.NONE, initialItemList: Repeat.values);
  final DropDownController<Category> _dropDownControllerCategory =
      DropDownController(initialItemList: []);
  final TextEditingController _textEditingControllerEventName = TextEditingController();
  final TextEditingController _textEditingControllerDescription = TextEditingController();
  final TextEditingController _textEditingControllerDate = TextEditingController();
  final TextEditingController _textEditingControllerStartTime = TextEditingController();
  final TextEditingController _textEditingControllerEndTime = TextEditingController();
  final TextEditingController _textEditingControllerRepeatEndDate = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKeyAddEventBot = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEventBloc, PageState>(
      bloc: _bloc,
      builder: (context, state) {
        _dropDownControllerCategory.updateItemList(state.listCategory);
        _textEditingControllerDate.text = state.date.formatToString(DateFormatType.ddMMyyyy.pattern);
        _textEditingControllerRepeatEndDate.text =
            state.repeatEnddate.formatToString(DateFormatType.ddMMyyyy.pattern);
        _textEditingControllerEndTime.text = state.endTime.format(context);
        _textEditingControllerStartTime.text = state.startTime.format(context);
        if (_textEditingControllerStartTime.text.isNullOrEmpty()) {
          _textEditingControllerStartTime.text = state.startTime.format(context);
        }
        if (_textEditingControllerEndTime.text.isNullOrEmpty()) {
          _textEditingControllerEndTime.text = state.endTime.format(context);
        }

        if (_textEditingControllerEventName.text.isNullOrEmpty()) {
          _textEditingControllerEventName.text = state.name;
        }
        if (_textEditingControllerDescription.text.isNullOrEmpty()) {
          _textEditingControllerDescription.text = state.description;
        }
        if (_dropDownControlleRepeat.value == null) {
          _dropDownControlleRepeat.value = _stringToRepeat(state.repeat);
        }
        if (_dropDownControllerCategory.value == null) {
          _dropDownControllerCategory.value = state.category;
        }
        return SingleChildScrollView(
          child: StatefulBuilder(
            builder: (context, setState) => Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonForm(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 35,
                              height: 35,
                            ),
                            Expanded(
                              child: Text(
                                R.strings.add_event,
                                style:
                                    R.textStyle.inter_medium_20_500.copyWith(color: R.color.text),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // bot add event
                            GestureDetector(
                              onTap: () async {
                                final result = await _showDialogAddEventBot();
                                if (result) {
                                  _bloc.add(EventSubmitMessageGenAi());
                                }
                              },
                              child: SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: SvgPicture.asset(
                                    R.drawables.ic_ai,
                                    color: R.color.app_color,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        // event name
                        CommonTextFormField(
                          controller: _textEditingControllerEventName,
                          hintText: R.strings.event_name,
                          onSaved: (newValue) =>
                              _bloc.add(EventUserChangeNameEvent(name: newValue)),
                          validator: (value) =>
                              value.isNullOrEmpty() ? R.strings.please_enter_event : null,
                        ),
                        SizedBox(height: 12),
                        // DesCription
                        CommonTextFormField(
                          controller: _textEditingControllerDescription,
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
                          textController: _textEditingControllerDate,
                          hintText: R.strings.date,
                          onSaved: (date) {
                            _selectedDate = date;
                            _bloc.add(EventUserChangeDate(date: date));
                          },
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
                                textController: _textEditingControllerStartTime,
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
                                textController: _textEditingControllerEndTime,
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
                                onChangedItem: (item, isReset) {
                                  if (item != Repeat.NONE) {
                                    _bloc.add(EventEnableRepetEndate());
                                    _bloc.add(EventUserChangeRepeat(repeat: item?.value));
                                  } else {
                                    _bloc.add(EventdisableRepetEndate());
                                  }
                                },
                                onSavedItem: (value) =>
                                    _bloc.add(EventUserChangeRepeat(repeat: value?.value)),
                                initialItem: Repeat.NONE,
                                itemList: Repeat.values,
                                controller: _dropDownControlleRepeat,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // repet endate
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                R.strings.repetEnddate,
                                style: R.textStyle.inter_regular_16_400
                                    .copyWith(color: R.color.timeEvent),
                              ),
                            ),
                            SizedBox(
                              width: 220,
                              child: DateTimeFormFieldWidget(
                                textController: _textEditingControllerRepeatEndDate,
                                isEnabled: state.showDateFormFiledRepet,
                                isRequired: state.showDateFormFiledRepet,
                                hintText: R.strings.repetEnddate,
                                onChanged: (value) {
                                  _bloc.add(EventChangeRepetEndDate(repetEndDate: value));
                                },
                                onSaved: (date) {
                                  DateTime savedDate;
                                  if (state.showDateFormFiledRepet) {
                                    // Nếu người dùng chọn ngày trong Repet End Date thì lưu ngày đó
                                    savedDate = date;
                                  } else {
                                    // Nếu không mở, lấy ngày chính + 1 ngày
                                    savedDate = (_selectedDate ?? DateTime.now())
                                        .add(const Duration(days: 1));
                                  }
                                  _bloc.add(EventChangeRepetEndDate(repetEndDate: savedDate));
                                },
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2090),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        _buildSelectedCategory()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ButtonWithIconWidget(
                    onPressed: _addEvent,
                    title: R.strings.submit,
                    radius: 10,
                  )
                ],
              ),
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
      _formKey.currentState!.save();
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

  // xu ly addEventBot o day .
  Future<bool> _showDialogAddEventBot() async {
    final result = await NavigatorUltils.pushDialog<bool>(context,
        dialog: CommonDialog(
          title: Text(R.strings.ai_support_add_event),
          description: CommonForm(
              key: _formKeyAddEventBot,
              child: CommonTextFormField(
                isRequired: true,
                hintText: R.strings.write_add_event_here,
                minLines: 5,
                onSaved: (value) => _bloc.add(EventUserChangeMessageGenAi(messageGenAi: value)),
                maxLines: 7,
                maxLength: 200,
              )),
          actionButtons: [
            // trong truong hop nhan vao oke thi phai kiem tra form xem co hop le hay khong
            ButtonWithIconWidget(
              onPressed: addEventBot,
              title: R.strings.ok,
              radius: 10,
            ),
            // trong truong hop nhan vao cancle thi k can kiem tra form
            ButtonWithIconWidget(
              onPressed: () => NavigatorUltils.safePop(context, false),
              title: R.strings.cancel,
              radius: 10,
            )
          ],
        ));
    return result ?? false;
  }

  void addEventBot() {
    if (_formKeyAddEventBot.currentState?.validate() ?? false) {
      _formKeyAddEventBot.currentState?.save();
      NavigatorUltils.safePop(context, true);
      // _bloc.add(EventSubmitMessageGenAi());
    }
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

  int _compareTime(TimeOfDay? t1, TimeOfDay? t2) {
    if (t1 == null || t2 == null) return -1; // Tránh lỗi null
    if (t1.hour < t2.hour) return -1;
    if (t1.hour > t2.hour) return 1;
    if (t1.minute < t2.minute) return -1;
    if (t1.minute > t2.minute) return 1;
    return 0;
  }
}
