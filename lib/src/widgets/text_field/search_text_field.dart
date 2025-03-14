
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/gen/assets.gen.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/common_icon_button.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    this.textEditingController,
    super.key,
    this.iconSize = 40,
    this.onPressSearch,
    this.hintText,
    this.onSubmitted,
    this.iconAsset,
    this.readOnly = true,
    this.enabled,
  });

  final TextEditingController? textEditingController;
  final double iconSize;
  final void Function()? onPressSearch;
  final String? hintText;
  final void Function(String)? onSubmitted;
  final String? iconAsset;
  final bool readOnly;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: R.color.F3F4F6),
        color: R.color.white,
        boxShadow: [
          BoxShadow(
            color: R.color.inputColorTextPlaceholder,
            spreadRadius: 0,
            blurRadius: 2,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: TextField(
        cursorColor: R.color.black,
        enabled: enabled,
        readOnly: readOnly,
        autocorrect: false,
        onSubmitted: onSubmitted,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText ?? R.strings.search,
          hintStyle: R.textStyle.inter_regular_16_400.copyWith(
            color: R.color.inputColorTextPlaceholder,
          ),
          fillColor: R.color.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: R.color.colorBgContainer),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: R.color.colorBgContainer),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          suffixIconConstraints: BoxConstraints(minWidth: iconSize, maxWidth: iconSize),
          suffixIcon: CommonIconButton(
            iconAsset: iconAsset ?? R.drawables.ic_search,
            backgroundColor: R.color.colorBgContainerDisabled,
            iconSize: 16,
            size: iconSize,
            onPressed: onPressSearch,
          ),
        ),
      ),
    );
  }
}
