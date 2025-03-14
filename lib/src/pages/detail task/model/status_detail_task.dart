import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';

Widget statusDetailTask(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 7),
    decoration: BoxDecoration(
        color: R.color.statusTodo,
        border: Border.all(color: R.color.statusTodo),
        borderRadius: BorderRadius.all(Radius.circular(20))),
    child: Text(text , style: R.textStyle.inter_medium_12_500.copyWith(color: R.color.textStatusTodo),),
  );
}
