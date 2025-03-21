
import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';

class FlexibleDialog extends StatelessWidget {
  const FlexibleDialog({
    super.key,
    this.title,
    this.description,
    this.actionButton,
    this.padding,
  });

  final Widget? title;
  final Widget? description;
  final Widget? actionButton;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final _buildTitle = title;
    final _buildDescription = description;

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_buildTitle != null) ...[
              DefaultTextStyle(
                style: R.textStyle.inter_medium_16_500.copyWith(color: R.color.black),
                textAlign: TextAlign.center,
                child: _buildTitle,
              ),
              const SizedBox(height: 16),
            ],
            if (_buildDescription != null) ...[
              DefaultTextStyle(
                style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.black),
                textAlign: TextAlign.center,
                child: _buildDescription,
              ),
              const SizedBox(height: 16),
            ],
            actionButton ??
                ElevatedButton(
                  onPressed: () => NavigatorUltils.safePop(context, true),
                  child: Text(R.strings.ok),
                ),
          ],
        ),
      ),
    );
  }
}
