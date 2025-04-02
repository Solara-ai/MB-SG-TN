import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/domain/model/epic.dart';
import 'package:schedule_gen_and_time_management/domain/model/task.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/add%20task/add_task_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/detail%20epic/detail_epic_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/detail%20task/detail_task_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/edit_epic/edit_epic_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/edit_epic/model/epic_name.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/size_config.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/action_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/button/floating_action_button.dart';
import 'package:schedule_gen_and_time_management/src/widgets/empty_list_view.dart';
import 'package:schedule_gen_and_time_management/src/widgets/loading/loading_overlay.dart';

class DetailEpicPage extends BasePage {
  final Epic epic;

  const DetailEpicPage({super.key, required this.epic});

  @override
  _DetailEpicPageState createState() => _DetailEpicPageState();
}

class _DetailEpicPageState extends BaseState<DetailEpicPage> {
  late DetailEpicBloc _bloc;

  @override
  void initState() {
    _setupBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    // TODO: implement dispose
    super.dispose();
  }

  void _setupBloc() {
    _bloc = DetailEpicBloc(epic: widget.epic);
    _bloc.listenAction(cancelSubOnDispose, (action) async {
      switch (action) {
        case ActionDeleteTaskSuccess():
          ToastUtils.showSuccessToast(context, message: R.strings.delete_task_success);
          _bloc.add(EventLoadListTask());
          _bloc.add(EventLoadDetailEpic());
        case ActionNavigateAddTask():
          final result =
              await NavigatorUltils.navigatePage<bool>(context, AddTaskPage(epic: widget.epic));
          if (result == true) {
            _bloc.add(EventLoadListTask());
            _bloc.add(EventLoadDetailEpic());
          }
        case ActionLoadedListTaskFailed():
          ToastUtils.showErrorToast(context, message: action.message);
        case ActionLoaddedDetailEpicFailed():
          ToastUtils.showErrorToast(context, message: action.message);
        case ActionNavigateEditEditEpic():
          NavigatorUltils.navigatePage(context, EditEpicPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailEpicBloc, PageState>(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
        backgroundColor: R.color.white,
        appBar: actionAppbar(
          backGroundColor: R.color.white,
          title: R.strings.detail_epic,
          action: [
            IconButton(
              onPressed: () {
                NavigatorUltils.navigatePage(context, EditEpicPage());
              },
              icon: SvgPicture.asset(R.drawables.ic_edit),
            ),
          ],
        ),
        floatingActionButton: buildFloatingButton(
            context: context,
            onPressed: () => _bloc.add(
                  EventNavigateAddTask(),
                )),
        body: _buildBody(state),
      ),
    );
  }

  Widget _buildBody(PageState state) {
    return LoadingOverlay(
      isLoading: state.showLoading,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
            ),
            Center(
              child: Image.asset(
                R.drawables.img_morning,
                width: 105,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _buildItemByEpic(state.epic),
            SizedBox(
              height: 15,
            ),
            Text(R.strings.all_task_of_epic,
                style: R.textStyle.inter_semibold_14_600.copyWith(color: R.color.text)),
            SizedBox(
              height: 15,
            ),
            state.listTask.tasks.isEmpty
                ? SizedBox(
                    height: SizeConfig.screenHeight - 450,
                    child: EmptyListView(
                      description: R.strings.no_task_here,
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          _buildItemTask(state.listTask.tasks[index], widget.epic , state),
                      separatorBuilder: (_, __) => SizedBox(
                        height: 10,
                      ),
                      itemCount: state.listTask.tasks.length,
                      shrinkWrap: true,
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget _buildItemByEpic(Epic epic) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5), // Màu của bóng
                spreadRadius: 0, // Độ lan rộng của bóng
                blurRadius: 6, // Độ mờ của bóng
                // Dịch chuyển bóng theo trục X và Y
                offset: Offset(0, 4)),
          ],
          color: epic.type == TypeEpic.work.value ? R.color.colorItemWork : R.color.colorItemStudy,
          border: Border.all(
              color: epic.type == TypeEpic.work.value
                  ? R.color.colorItemWork
                  : R.color.colorItemStudy),
          borderRadius: BorderRadius.circular(18)),
      height: 130,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(epic.nameEpic,
                          style: R.textStyle.inter_semibold_16_600.copyWith(color: R.color.text))),
                ),
              ),
              epic.type == TypeEpic.work.value
                  ? SvgPicture.asset(R.drawables.ic_work)
                  : SvgPicture.asset(R.drawables.ic_study)
            ],
          ),
          SizedBox(height: 1),
          Text(epic.descriptionEpic,
              style: R.textStyle.inter_medium_12_500.copyWith(color: R.color.textDescriptionItem)),
        ],
      ),
    );
  }

  Widget _buildItemTask(Task task, Epic epic , PageState state) {
    return GestureDetector(
      onTap: () => NavigatorUltils.navigatePage(context, DetailTaskPage(epic: epic, task: task)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        width: double.infinity,
        height: 117,
        decoration: BoxDecoration(
            color: R.color.EEE5FF,
            border: Border.all(color: R.color.EEE5FF),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text(
                        task.title,
                        style: R.textStyle.inter_medium_14_500.copyWith(color: R.color.text),
                      ),
                      GestureDetector(
                        onTap: () {
                          // thực hiện event lấy id cho vào state sau đó mơis gọi event xóa
                          _bloc.add(EventUserSelectTaskId( id: task.id));
                          _bloc.add(EventDeleteTask());
                        },
                        behavior: HitTestBehavior.opaque,
                        child: SizedBox(
                          width: 40,
                          height: 20,
                          child: Text(
                            R.strings.delete,
                            style: R.textStyle.inter_regular_12_400.copyWith(
                                color: R.color.textStatusDone,
                                decoration: TextDecoration.underline,
                                decorationColor: R.color.textStatusDone),
                          ),
                        ),
                      ),
                    
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                      child: Text(task.description,
                          style: R.textStyle.inter_medium_12_500
                              .copyWith(color: R.color.textDescriptionItem))),
                ],
              ),
            ),
            Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: _buildItemStatus(task))
          ],
        ),
      ),
    );
  }

  void showFunction() {
    showModalBottomSheet(
      context: context,
      backgroundColor: R.color.app_color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: SvgPicture.asset(R.drawables.ic_add_epic),
              title: Text(
                R.strings.add_new_epic,
                style: R.textStyle.inter_medium_20_500.copyWith(color: R.color.white),
              ),
              onTap: () => _bloc.add(EventNavigateAddTask()),
            ),
          ],
        );
      },
    );
  }

  Widget _buildItemStatus(Task task) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 76),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: colorStatus(task),
            border: Border.all(color: R.color.white),
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          task.status,
          style: R.textStyle.inter_medium_10_500.copyWith(color: colorTextStatus(task)),
        ),
      ),
    );
  }
}

Color colorStatus(Task task) {
  if (task.status == 'Done') {
    return R.color.statusDone;
  } else if (task.status == 'Inprogress') {
    return R.color.statusInprogress;
  } else {
    return R.color.statusTodo;
  }
}

Color colorTextStatus(Task task) {
  if (task.status == 'Done') {
    return R.color.textStatusDone;
  } else if (task.status == 'Inprogress') {
    return R.color.textStatusInprogress;
  } else {
    return R.color.textStatusTodo;
  }
}

enum StatusTask {
  DONE('Done'),
  INPROGRESS('Inprogress'),
  TODO('To do');

  final String status;
  const StatusTask(this.status);
}
