

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:schedule_gen_and_time_management/gen/assets.gen.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';

class DateTimeFormFieldWidget extends StatefulWidget {
  final String? title;
  final TextStyle? titleStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool isEnabled;
  final bool isRequired;
  final DateTime? initialDate;
  final DateFormatType dateFormatter;
  final ValueChanged<DateTime>? onChanged;
  final ValueChanged<DateTime> onSaved;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final TextEditingController? textController;

  const DateTimeFormFieldWidget({super.key, 
    required this.onSaved,
    this.hintText,
    this.hintStyle,
    this.onChanged,
    this.isEnabled = true,
    this.isRequired = true,
    this.title,
    this.titleStyle,
    this.initialDate,
    this.dateFormatter = DateFormatType.ddMMyyyy,
    this.firstDate,
    this.lastDate,
    this.textController,
  });

  @override
  _DateTimeFormFieldWidgetState createState() => _DateTimeFormFieldWidgetState();
}

class _DateTimeFormFieldWidgetState extends State<DateTimeFormFieldWidget> {
  late final TextEditingController _textController;

  late DateTime selectedDate;

  @override
  void initState() {
    selectedDate = widget.initialDate ?? DateTime.now();
    _textController = widget.textController ??
        TextEditingController(text: widget.initialDate?.formatToString(widget.dateFormatter.pattern));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFormField(
          controller: _textController,
          readOnly: true,
          enabled: widget.isEnabled,
          canRequestFocus: false,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          label: widget.title,
          labelStyle: widget.titleStyle,
          isRequired: widget.isRequired,
          suffixIcon: SvgPicture.asset(
            Assets.lib.res.drawables.icTabCalendar,
            colorFilter: ColorFilter.mode(R.color.black, BlendMode.srcIn),
            width: 20,
            height: 20,
          ),
          suffixIconConstraints: const BoxConstraints(minWidth: 50),
          onSaved: (newValue) {
            widget.onSaved(selectedDate);
          },
          onTap: () async {
            final date = await showDatePicker(
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: R.color.app_color,
                      onPrimary: R.color.white,
                      onSurface: R.color.black,
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(foregroundColor: R.color.app_color),
                    ),
                  ),
                  child: child!,
                );
              },
              context: context,
              firstDate: widget.firstDate ?? DateTime(1900),
              lastDate: widget.lastDate ?? DateTime.now(),
              currentDate: selectedDate,
            );
            if (date != null) {
              selectedDate = date;
              _textController.text = date.formatToString(widget.dateFormatter.pattern);
              widget.onChanged?.call(date);
            }
          },
        ),
      ],
    );
  }
}
