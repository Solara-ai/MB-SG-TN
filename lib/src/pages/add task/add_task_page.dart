import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/domain/model/epic.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/add%20task/add_task_bloc.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/action_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/button_with_icon.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_form.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/common_text_form_field.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

class AddTaskPage extends BasePage {
  final Epic epic;
  const AddTaskPage({super.key, required this.epic});
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends BaseState<AddTaskPage> {
  late AddTaskBloc _bloc;
  final _formKey = GlobalKey<FormState>();

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
    _bloc = AddTaskBloc(epic: widget.epic);
    _bloc.listenAction(cancelSubOnDispose, (action) {
      switch (action) {
        case ActionAddTaskSuccess():
          popPage(result: true);
          ToastUtils.showSuccessToast(context, message: R.strings.add_task_success);
          break;
        case ActionAddTaskFaild():
          ToastUtils.showErrorToast(context, message: action.message);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
        backgroundColor: R.color.white,
        appBar: actionAppbar(backGroundColor: R.color.white, title: R.strings.add_task),
        body: _buildBody(),
        bottomNavigationBar: _buildButtonBottom(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 27),
      child: CommonForm(
        key: _formKey,
        child: Column(
          children: [
            CommonTextFormField(
              label: R.strings.task_name,
              isRequired: true,
              hintText: R.strings.name_of_task,
              onSaved: (title) {
                _bloc.add(EventUserChangeTitleTask(title: title));
              },
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            CommonTextFormField(
              label: R.strings.description,
              isRequired: true,
              hintText: R.strings.write_description_here,
              onSaved: (description) {
                _bloc.add(EventUserChangeDescriptionTask(description: description));
              },
              maxLength: 120,
              minLines: 4,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonBottom() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 31, horizontal: 15),
        child: ButtonWithIconWidget(
          title: R.strings.save,
          onPressed: _addTask,
        ),
      ),
    );
  }

  void _addTask() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      _bloc.add(EventAddTask());
    }
  }
}
