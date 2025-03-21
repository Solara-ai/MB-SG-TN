import 'package:flutter/widgets.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/app_rounded_button.dart';
import 'package:schedule_gen_and_time_management/src/widgets/dialogs/flexible_dialog.dart';

class PermissionDialogWidget extends StatelessWidget {
  final String title;
  final String description;

  const PermissionDialogWidget({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleDialog(
      title: Text(
        title,
        style: R.textStyle.inter_medium_16_500.copyWith(
          color: R.color.gray_black,
        ),
      ),
      description: Text(
        description,
        style: R.textStyle.inter_regular_16_400.copyWith(
          color: R.color.gray_black,
        ),
      ),
      actionButton: Row(
        children: [
          Expanded(
            child: AppRoundedButton(
              onPressed: () => NavigatorUltils.safePop(context),
              backgroundColor: R.color.white,
              child: Text(
                R.strings.cancel,
                style: R.textStyle.inter_regular_12_400.copyWith(
                  color: R.color.black,
                ),
              ),
            ),
          ),
          SizedBox(width: 8,),
          Expanded(
            child: AppRoundedButton(
              onPressed: () => NavigatorUltils.safePop(context, true),
              backgroundColor: R.color.app_color,
              child: Text(
                R.strings.open,
                style: R.textStyle.inter_regular_12_400.copyWith(
                  color: R.color.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
