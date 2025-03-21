import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/svg_image.dart';

class ActionSheet {
  final String value;
  final String displayValue;
  final String assetName;

  ActionSheet({required this.value, required this.displayValue, required this.assetName});
}

class ActionSheetItem extends StatelessWidget {
  const ActionSheetItem({
    required this.item,
    super.key,
  });

  final ActionSheet item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NavigatorUltils.safePop(context, item.value),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            SvgImage.square(
              item.assetName,
              demension: 24,
            ),
            const SizedBox(width: 8),
            Expanded(
                child: Text(
              item.displayValue,
              style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.text),
            )),
          ],
        ),
      ),
    );
  }
}
