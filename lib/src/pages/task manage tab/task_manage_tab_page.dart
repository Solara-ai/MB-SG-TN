import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/detail%20epic/detail_epic_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/model/all_epic.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/model/list_app_epic.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/model/study_epic.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage%20tab/model/work_epic.dart';
import 'package:schedule_gen_and_time_management/src/pages/task%20manage/model/task_manage_tab.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/widgets/keep_alive_page.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/search_text_field.dart';

class TaskManageTabPage extends BasePage {
  const TaskManageTabPage({required this.tab, super.key});
  final TaskManageTab tab;

  @override
  _TaskManageTabPageState createState() => _TaskManageTabPageState();
}

class _TaskManageTabPageState extends BaseState<TaskManageTabPage> {
 
 List<StudyEpic> listStudyEpic = [];
 List<WorkEpic> listWorkEpic = [];
 
 void settingsListEpicAndWork () {
   for (AllEpic epic in allEpic) {
      if (epic is StudyEpic) {
        listStudyEpic.add(epic);
      }
      else if (epic is WorkEpic) {
        listWorkEpic.add(epic);
      }
   }
 }

 @override 
 void initState() {
    settingsListEpicAndWork();
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: R.color.white, body: _buildPageContent() , 
   );
  }

  Widget _buildPageContent() {
    return KeepAlivePage(
      child: LayoutBuilder(
        builder: (context, contraints) => ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: contraints.maxWidth, minHeight: contraints.maxHeight),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SearchTextField(
                  onPressSearch: () {
                    FocusScope.of(context).unfocus();
                  },
                  readOnly: false,
                ),
                SizedBox(
                  height: 23,
                ),
                if (widget.tab == TaskManageTab.ALL) ... [
                   Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context , index) {
                          return _buildItem(allEpic[index]);
                        } ,
                        separatorBuilder: (context , index) => SizedBox(height: 10,),
                        itemCount: allEpic.length))
                ] 
                else if (widget.tab == TaskManageTab.STUDY) ...[
                    Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context , index) {
                          return _buildItem(listStudyEpic[index]);
                        } ,
                        separatorBuilder: (context , index) => SizedBox(height: 10,),
                        itemCount: listStudyEpic.length))
                ]
                else ... [
                   Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context , index) {
                          return _buildItem(listWorkEpic[index]);
                        } ,
                        separatorBuilder: (context , index) => SizedBox(height: 10,),
                        itemCount: listWorkEpic.length))
                ]
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(AllEpic epic) {
    return GestureDetector(
      onTap: () => NavigatorUltils.navigatePage(context, DetailEpicPage(epic: epic)),
      child: Container(
        width: double.infinity,
        height: 95,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            color: epic is StudyEpic ? R.color.colorItemStudy : R.color.colorItemWork,
            border:
                Border.all(color: epic is StudyEpic ? R.color.colorItemStudy : R.color.colorItemWork),
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(epic.name , style: R.textStyle.inter_semibold_14_600.copyWith(color: R.color.text),)),
                epic is StudyEpic
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(R.drawables.ic_study),
                      )
                    : SizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(R.drawables.ic_work),
                      )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(epic.desCription ,style: R.textStyle.inter_medium_12_500 .copyWith(color: R.color.textDescriptionItem),)
          ],
        ),
      ),
    );
  }
}
