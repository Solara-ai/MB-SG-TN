import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';

class EmptyListView extends StatelessWidget {
  final String description;
  const EmptyListView({super.key , this.description = '' });
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(R.drawables.empty_img),
            SizedBox(height: 24,),
            Text(description , style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.ADB5BD),)
          ],
        ),
    );
  }
}