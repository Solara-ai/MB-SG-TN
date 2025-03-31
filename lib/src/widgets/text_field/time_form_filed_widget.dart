import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';

class TimeFormFieldWidget extends StatefulWidget {
  final String? Function(String?)? validator;
  final String? title;
  final TextStyle? titleStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool isEnabled;
  final bool isRequired;
  final TimeOfDay? initialTime;
  final ValueChanged<TimeOfDay>? onChanged;
  final ValueChanged<TimeOfDay> onSaved;
  final TextEditingController? textController;

  const TimeFormFieldWidget({super.key,
    required this.onSaved,
    this.hintText,
    this.hintStyle,
    this.onChanged,
    this.isEnabled = true,
    this.isRequired = true,
    this.title,
    this.titleStyle,
    this.initialTime,
    this.textController,
    this.validator
  });

  @override
  _TimeFormFieldWidgetState createState() => _TimeFormFieldWidgetState();
}

class _TimeFormFieldWidgetState extends State<TimeFormFieldWidget> {
  late final TextEditingController _textController;
  late TimeOfDay? selectedTime;

  @override
  void initState() {
    selectedTime = widget.initialTime;
    _textController = widget.textController ?? TextEditingController(
      text: selectedTime != null 
          ? "${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}" 
          : ""
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFormField(
          validator: widget.validator ,
          controller: _textController,
          readOnly: true,
          enabled: widget.isEnabled,
          canRequestFocus: false,
          hintText: selectedTime == null ? widget.hintText : null,
          hintStyle: widget.hintStyle,
          label: widget.title,
          labelStyle: widget.titleStyle,
          isRequired: widget.isRequired,
          suffixIcon: SvgPicture.asset(
            R.drawables.ic_time_cicle,
            colorFilter: ColorFilter.mode(R.color.black, BlendMode.srcIn),
            width: 20,
            height: 20,
          ),
          suffixIconConstraints: const BoxConstraints(minWidth: 50),
          onSaved: (newValue) {
            if (selectedTime != null) {
              widget.onSaved(selectedTime!);
            }
          },
          onTap: () async {
            final time = await showTimePicker(
              context: context,
              initialTime: selectedTime ?? TimeOfDay.now(),
            );
            if (time != null) {
              setState(() {
                selectedTime = time;
                _textController.text = "${time.hour}:${time.minute.toString().padLeft(2, '0')}";
                widget.onChanged?.call(time);
              });
            }
          },
        ),
      ],
    );
  }
}
