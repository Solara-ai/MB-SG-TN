import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/add_category/add_category_bloc.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/custom_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/dialogs/common_dialog.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';

class AddCategoryPage extends BasePage {
  const AddCategoryPage({super.key});
  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends BaseState<AddCategoryPage> {
  late AddCategoryBloc _bloc;

  @override
  void initState() {
    _setupBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _setupBloc() {
    _bloc = AddCategoryBloc();
    _bloc.listenAction(cancelSubOnDispose, (action) {
      switch (action) {
        case ActionAddCategorySuccess():
          ToastUtils.showSuccessToast(context, message: R.strings.add_category_success);
          NavigatorUltils.safePop(context);
        case ActionAddCategoryFaild() : ToastUtils.showErrorToast(context, message: action.error);
      }
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCategoryBloc, PageState>(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
        appBar: appBar(R.strings.add_categoryy),
        backgroundColor: R.color.white,
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            child: ButtonWithIconWidget(
              onPressed:_addCategory,
              title: R.strings.add,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: CommonForm(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextFormField(
                  label: R.strings.name_of_category,
                  isRequired: true,
                  onSaved: (newValue) => _bloc.add(EventUserChangeCategoryName(cateGoryName: newValue)),
                ),
                SizedBox(height: 15),
                Text(
                  R.strings.select_color,
                  style: R.textStyle.inter_regular_16_400.copyWith(color: R.color.text),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: state.selectedColor,
                            border: Border.all(color: state.selectedColor),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(width: 10),
                    ButtonWithIconWidget(
                      onPressed: () {
                        NavigatorUltils.pushDialog(context, dialog: _buildDialog(state));
                      },
                      title: R.strings.chosse_color,
                      radius: 15,
                      titleStyle: R.textStyle.inter_medium_12_500.copyWith(color: R.color.white),
                      height: 30,
                      padding: EdgeInsets.all(7),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDialog(PageState state) {
    return CommonDialog(
      title: Text(R.strings.select_color),
      description: _buildColorPicker(state),
      isSeperate: true,
      actionButtons: [
        ButtonWithIconWidget(
          onPressed: () {
            NavigatorUltils.safePop(context);
          },
          title: R.strings.save,
        )
      ],
    );
  }

  Widget _buildColorPicker(PageState state) {
    return BlockPicker(
        pickerColor: state.selectedColor,
        onColorChanged: (color) {
          _bloc.add(EventUserSelectedColor(color: color));
        },
        availableColors: [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.yellow,
          Colors.orange,
          Colors.purple,
          Colors.pink,
          Colors.teal,
          Colors.cyan,
          Colors.lime,
          Colors.indigo,
          Colors.brown,
          Colors.grey,
          Colors.black,
          Colors.amber,
          Colors.deepOrange,
        ]);
  }

  void _addCategory () {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      _bloc.add(EventUserAddCategory());
    }
  }
}
