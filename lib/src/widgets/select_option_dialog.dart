import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/multiple_selected_model.dart';

class SelectOptionDialog extends StatefulWidget {
  const SelectOptionDialog({
    required this.title,
    required this.options,
    required this.selectedItems,
    required this.onSave,
    super.key,
  });

  final List<MultipleSelectModel> options;
  final List<MultipleSelectModel> selectedItems;
  final void Function(List<MultipleSelectModel> items) onSave;
  final String title;
  @override
  State<SelectOptionDialog> createState() => _SelectOptionDialogState();
}

class _SelectOptionDialogState extends State<SelectOptionDialog> {
  late List<MultipleSelectModel> selectedOptions;

  @override
  void initState() {
    super.initState();
    selectedOptions = List.from(widget.selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: R.color.black.withOpacity(0.2),
        body: Center(
          child: Container(
            height: 500,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: R.color.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  Column _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeaderTitle(),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              final item = widget.options[index];
              final isSelected = selectedOptions.any((e) => e.selectId == item.selectId);
              return _buildOptionItem(item, isSelected);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 1,
              );
            },
            itemCount: widget.options.length,
          ),
        ),
        _buildButtons(
          cancel: () {
            Navigator.of(context).pop();
          },
          onSave: () {
            widget.onSave(selectedOptions);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  Widget _buildOptionItem(MultipleSelectModel item, bool isSelected) {
    return GestureDetector(
      onTap: () => _selectedItem(item),
      child: Container(
        color: isSelected ? R.color.black.withOpacity(0.04) : R.color.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        child: Row(
          children: [
            SvgPicture.asset(
              isSelected ? R.drawables.ic_checkbox_selected : R.drawables.ic_checkbox_un_select,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
                child: Text(
              item.selectName,
              style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.text),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderTitle() {
    return Container(
      padding: const EdgeInsets.all(20),
      // color: R.color.error,
      child: Row(
        children: [
          Text(
            widget.title,
            style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.black.withOpacity(0.88)),
          ),
          const Spacer(),
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 26,
            child: SvgPicture.asset(
              R.drawables.ic_close,
              width: 22,
              height: 22,
              fit: BoxFit.cover,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  Widget _buildButtons({required VoidCallback cancel, required VoidCallback onSave}) {
    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: R.color.bgContainer),
                borderRadius: BorderRadius.circular(12),
              ),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: cancel,
                 child: Text(
                  R.strings.cancel,
                  style: R.textStyle.inter_semibold_14_600.copyWith(color: R.color.black.withOpacity(0.65)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: R.color.app_color,
              ),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: onSave,
                child: Text(
                  R.strings.save,
                  style: R.textStyle.inter_semibold_14_600.copyWith(color: R.color.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectedItem(MultipleSelectModel item) {
    if (selectedOptions.any((e) => e.selectId == item.selectId)) {
      selectedOptions.removeWhere((e) => e.selectId == item.selectId);
    } else {
      selectedOptions.add(item);
    }
    setState(() {});
  }
}
