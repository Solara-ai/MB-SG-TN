import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    super.key,
    this.title,
    this.description,
    this.actionButtons,
    this.isSeperate = false,
  });

  final Widget? title;
  final Widget? description;
  final List<Widget>? actionButtons;
  final bool isSeperate;

  @override
  Widget build(BuildContext context) {
    final _buildTitle = title;
    final _buildDescription = description;

    return Dialog(
      backgroundColor: R.color.white,
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_buildTitle != null) ...[
              DefaultTextStyle(
                style: R .textStyle.inter_semibold_20_600.copyWith(color: R.color.black),
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
            if (actionButtons != null && actionButtons!.isNotEmpty) ...[
              if (isSeperate) ...[
                Column(
                  children: actionButtons!
                      .map((button) => SizedBox(
                            width: double.infinity,
                            child: button,
                          ))
                      .toList(),
                )
              ] else ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: actionButtons!
                      .mapIndexed((index, button) => Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 0 : 4,
                                right: index == (actionButtons!.length - 1) ? 0 : 4,
                              ),
                              child: button)))
                      .toList(),
                ),
              ]
            ] else ...[
              ElevatedButton(
                onPressed: () => NavigatorUltils.safePop(context, true),
                child: Text(R.strings.ok),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
