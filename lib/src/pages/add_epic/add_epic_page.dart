import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/add_epic/add_epic_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/edit_epic/model/epic_name.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/action_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

class AddEpicPage extends BasePage {
  const AddEpicPage({super.key});
  @override
  _AddEpicPageState createState() => _AddEpicPageState();
}

class _AddEpicPageState extends BaseState<AddEpicPage> {
  final _formKey = GlobalKey<FormState>();
  late AddEpicBloc _bloc;
  DropDownController<TypeEpic> dropDownController =
      DropDownController<TypeEpic>(initialItemList: TypeEpic.values);
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
    _bloc = AddEpicBloc();
    _bloc.listenAction(cancelSubOnDispose, (action) {
      switch (action) {
        case AddEpicSuccess():
          ToastUtils.showSuccessToast(context, message: R.strings.add_epic_success);
          popPage();
        case AddEpicFaild():
          ToastUtils.showSuccessToast(context, message: action.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEpicBloc, PageState>(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
        backgroundColor: R.color.white,
        appBar: actionAppbar(backGroundColor: R.color.white, title: R.strings.add_epic),
        body: _buildBody(_formKey),
        bottomNavigationBar: _buildButtonBottom(_formKey),
      ),
    );
  }

  Widget _buildBody(GlobalKey<FormState> formkey) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 27),
      child: CommonForm(
        key: formkey,
        child: Column(
          children: [
            CommonTextFormField(
              label: R.strings.epic_name,
              isRequired: true,
              hintText: R.strings.name_of_epic,
              onSaved: (newValue) => _bloc.add(EventChangeEpicName(epicname: newValue)),
            ),
            SizedBox(
              height: 15,
            ),
            DropdownFormField<TypeEpic>(
              label: R.strings.type_name_of_epic,
              isRequired: true,
              controller: dropDownController,
              onSavedItem: (typeEpic) =>
                  _bloc.add(EventChangeTypeNameEpic(typeNameEpic: typeEpic?.value ?? '')),
            ),
            SizedBox(
              height: 15,
            ),
            CommonTextFormField(
              label: R.strings.description,
              isRequired: true,
              hintText: R.strings.write_description_here,
              maxLength: 120,
              minLines: 4,
              maxLines: 4,
              onSaved: (newValue) =>
                  _bloc.add(EventChangeDescriptionEpic(descriptionEpic: newValue)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonBottom(GlobalKey<FormState> formkey) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 31, horizontal: 15),
        child: ButtonWithIconWidget(
          title: R.strings.add,
          onPressed: _addEvent,
        ),
      ),
    );
  }

  void _addEvent() {
    if (_formKey.currentState?.validate() ?? false) {
      _bloc.add(EventAddEpic());
    }
  }
}
