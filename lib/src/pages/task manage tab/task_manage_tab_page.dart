import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/domain/model/epic.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/detail%20epic/detail_epic_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/edit_epic/model/epic_name.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/task_manage_tab_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage/model/task_manage_tab.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/widgets/keep_alive_page.dart';
import 'package:schedule_gen_and_time_management/src/widgets/loading/loading_overlay.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/search_text_field.dart';

class TaskManageTabPage extends BasePage {
  const TaskManageTabPage({required this.tab, super.key});
  final TaskManageTab tab;

  @override
  _TaskManageTabPageState createState() => _TaskManageTabPageState();
}

class _TaskManageTabPageState extends BaseState<TaskManageTabPage> {
  late TaskManageTabBloc _bloc;

  void _setupBloc() {
    _bloc = TaskManageTabBloc(tab: widget.tab);
    _bloc.listenAction(cancelSubOnDispose, (action) async {
      switch (action) {
        case ActionDeleteEpicSuccess():
          ToastUtils.showSuccessToast(context, message: R.strings.delete_epic_success);
          _bloc.add(EventInitialize());
        case ActionNavigateDetailEpic():
          final result =
              await NavigatorUltils.navigatePage<bool>(context, DetailEpicPage(epic: action.epic));
          if (result == true) {
            _bloc.add(EventLoadedListEpic());
          }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _setupBloc();
    _bloc.add(EventLoadedListEpic());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskManageTabBloc, PageState>(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
        backgroundColor: R.color.white,
        body: _buildPageContent(state),
      ),
    );
  }

  Widget _buildPageContent(PageState state) {
    return KeepAlivePage(
      child: RefreshIndicator(
        onRefresh: () {
          _bloc.add(EventLoadedListEpic());
          return Future.delayed(const Duration(seconds: 1));
        },
        child: LayoutBuilder(
          builder: (context, contraints) => LoadingOverlay(
            isLoading: state.showLoading,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minWidth: contraints.maxWidth, minHeight: contraints.maxHeight),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 23,
                    ),
                    state.epicList.isEmpty
                        ? SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: SizedBox(
                              height: contraints.maxHeight - 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(R.drawables.ic_empty_img_simple),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(R.strings.no_epic_here,
                                      style: R.textStyle.inter_regular_14_400
                                          .copyWith(color: R.color.textDescriptionItem))
                                ],
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return _buildItem(state.epicList[index]);
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 10,
                                    ),
                                itemCount: state.epicList.length),
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Epic epic) {
    return GestureDetector(
      onTap: () => NavigatorUltils.navigatePage(context, DetailEpicPage(epic: epic)),
      child: Container(
        width: double.infinity,
        height: 95,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            color:
                epic.type == TypeEpic.study.value ? R.color.colorItemStudy : R.color.colorItemWork,
            border: Border.all(
                color: epic.type == TypeEpic.study.value
                    ? R.color.colorItemStudy
                    : R.color.colorItemWork),
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  epic.nameEpic,
                  style: R.textStyle.inter_semibold_14_600.copyWith(color: R.color.text),
                )),
                if (epic.type == TaskManageTab.STUDY.value)
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(R.drawables.ic_study),
                  )
                else if (epic.type == TaskManageTab.WORK.value)
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(R.drawables.ic_work),
                  )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              epic.descriptionEpic,
              style: R.textStyle.inter_medium_12_500.copyWith(color: R.color.textDescriptionItem),
            ),
            SizedBox(height: 10,),

            Container(
              margin: EdgeInsets.only(left: 300),
              child: GestureDetector(
                onTap: () {
                  // thực hiện event lấy id cho vào state sau đó mơis gọi event xóa
                  _bloc.add(EventUserSelectEpicId(epicId: epic.id));
                  _bloc.add(EventDeleteEpic());
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
            ),
          ],
        ),
      ),
    );
  }
}
