import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/domain/model/epic.dart';
import 'package:schedule_gen_and_time_management/domain/model/task.dart';
import 'package:schedule_gen_and_time_management/gen/assets.gen.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/detail%20task/detail_task_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/detail%20task/model/status_detail_task.dart';
import 'package:schedule_gen_and_time_management/src/pages/edit_task/edit_task_page.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/action_appbar.dart';

class DetailTaskPage extends BasePage {
  final Epic epic;
  final Task task;
  const DetailTaskPage({super.key, required this.epic, required this.task});

  @override
  _DetailTaskPageState createState() => _DetailTaskPageState();
}

class _DetailTaskPageState extends BaseState<DetailTaskPage> {
  late DetailTaskBloc _bloc;

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
    _bloc = DetailTaskBloc(task: widget.task, epic: widget.epic);
    _bloc.listenAction(cancelSubOnDispose, (action) async {
      switch (action) {
        case ActionNavigateEditTask():
          final result = await NavigatorUltils.navigatePage<bool>(context, EditTaskPage());
          if (result == true) {
            _bloc.add(EventInitilize());
          }
        case ActionLoaddedDataFaild():
          ToastUtils.showErrorToast(context, message: action.messsage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailTaskBloc, PageState>(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
          appBar: actionAppbar(
            title: R.strings.detail_task,
            textStyle: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: R.color.text),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: _buildBody(state)),
    );
  }

  Widget _buildBody(PageState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 41, horizontal: 37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(Assets.lib.res.drawables.imgTask.path),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            state.epicName,
            style: R.textStyle.inter_semibold_16_600.copyWith(color: R.color.text),
          ),
          SizedBox(height: 19),
          Text(state.description,
              style: R.textStyle.inter_medium_12_500.copyWith(color: R.color.colorTextDescription)),
          SizedBox(height: 47),
          Text(
            state.epicName,
            style: R.textStyle.inter_semibold_16_600.copyWith(color: R.color.text),
          ),
          SizedBox(height: 19),
          Text(
            R.strings.status,
            style: R.textStyle.inter_semibold_16_600.copyWith(color: R.color.text),
          ),
          SizedBox(height: 13),
          statusDetailTask('todo')
        ],
      ),
    );
  }

}
