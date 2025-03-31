import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/detail%20epic/model/list_task.dart';
import 'package:schedule_gen_and_time_management/src/pages/detail%20epic/model/task.dart';
import 'package:schedule_gen_and_time_management/src/pages/edit_epic/edit_epic_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/model/all_epic.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/model/study_epic.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/model/work_epic.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/appbar/action_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/empty_list_view.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/search_text_field.dart';

class DetailEpicPage extends BasePage {
  final AllEpic epic;

  const DetailEpicPage({super.key, required this.epic});

  @override
  _DetailEpicPageState createState() => _DetailEpicPageState();
}

class _DetailEpicPageState extends BaseState<DetailEpicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(
            readOnly: false,
            onPressSearch: () => FocusScope.of(context).unfocus(),
          ),
          SizedBox(
            height: 15,
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
          _buildItemDetailEpic(widget.epic),
          SizedBox(
            height: 15,
          ),
          Text(R.strings.all_task_of_epic,
              style: R.textStyle.inter_semibold_14_600.copyWith(color: R.color.text)) ,
          SizedBox(height: 15,),
          Expanded(child: 
          ListView.separated(itemBuilder: (context , index)=>_buildItemTask(listTask[index]), separatorBuilder: (_,  __) =>SizedBox(height: 10,), itemCount: listTask.length , shrinkWrap: true,)
          // EmptyListView(description: R.strings.no_task_here,)
          )
        ],
      ),
    );
  }

  Widget _buildItemDetailEpic(AllEpic epic) {
    if (epic is StudyEpic) {
      return _buildItemByEpic(epic);
    } else {
      return _buildItemByEpic(epic);
    }
  }

  Widget _buildItemByEpic(AllEpic epic) {
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
          color: epic is WorkEpic ? R.color.colorItemWork : R.color.colorItemStudy,
          border:
              Border.all(color: epic is WorkEpic ? R.color.colorItemWork : R.color.colorItemStudy),
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
                      child: Text(epic.name,
                          style: R.textStyle.inter_semibold_16_600.copyWith(color: R.color.text))),
                ),
              ),
              epic is WorkEpic
                  ? SvgPicture.asset(R.drawables.ic_work)
                  : SvgPicture.asset(R.drawables.ic_study)
            ],
          ),
          SizedBox(height: 1),
          Text(epic.desCription,
              style: R.textStyle.inter_medium_12_500.copyWith(color: R.color.textDescriptionItem)),

        ],
      ),
    );
  }

  Widget _buildItemTask(Task task) {
    return Container(
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
                Text(
                  task.name,
                  style: R.textStyle.inter_medium_14_500.copyWith(color: R.color.text),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(child: Text(task.description , style: R.textStyle.inter_medium_12_500.copyWith(color :R.color.textDescriptionItem))),
              ],
            ),
          ),
          Container(width: double.infinity , 
          alignment: Alignment.centerRight , 
          child: _buildItemStatus(task))
        ],
      ),
    );
  }

  Widget _buildItemStatus (Task task) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 76
      ),
      child: Container (
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: colorStatus(task),
          border: Border.all(color: R.color.white),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Text(task.status ,style: R.textStyle.inter_medium_10_500.copyWith(color: colorTextStatus(task)),),    
      ),
    );
  }
}

Color colorStatus (Task task) {
    if (task.status == 'Done') {
      return  R.color.statusDone;
    }
    else if (task.status == 'Inprogress') {
      return R.color.statusInprogress;
    }
    else  {
      return R.color.statusTodo;
    }
}

Color colorTextStatus (Task task) {
    if (task.status == 'Done') {
      return  R.color.textStatusDone;
    }
    else if (task.status == 'Inprogress') {
      return R.color.textStatusInprogress;
    }
    else  {
      return R.color.textStatusTodo;
    }
}


enum StatusTask {
  DONE('Done'),
  INPROGRESS('Inprogress'),
  TODO('To do');

  final String status;

  const StatusTask(this.status);

  // Color colorStatus(StatusTask status) {
  //   switch (status) {
  //     case StatusTask.DONE:
  //       return R.color.statusDone;
  //     case StatusTask.INPROGRESS:
  //       return R.color.statusInprogress;
  //     case StatusTask.TODO:
  //       return R.color.statusTodo;
  //   }
  // }
}
