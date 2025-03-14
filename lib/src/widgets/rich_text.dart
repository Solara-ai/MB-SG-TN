import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';

RichText buildRichtextDefault(
    {required String mainTitle,
    required String subtitle,
    TextStyle? styleMainTitle,
    TextStyle? styleSubtitle}) {
  return RichText(
    text: TextSpan(
      text: mainTitle,
      style: styleMainTitle ?? R.textStyle.inter_light_14_300.copyWith(color: R.color.text),
      children: [
        TextSpan(
            text: subtitle,
            style: R.textStyle.inter_light_14_300.copyWith(color: R.color.supportText))
      ],
    ),
  );
}
