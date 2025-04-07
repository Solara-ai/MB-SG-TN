import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/base_scafold/base_scaffold_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/performance_evaluation/performance_evaluation_bloc.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/widgets/custom_appbar.dart';
import 'package:schedule_gen_and_time_management/src/widgets/empty_list_view.dart';
import 'package:schedule_gen_and_time_management/src/widgets/loading/loading_overlay.dart';

class PerformanceEvaluationPage extends BasePage {
  const PerformanceEvaluationPage({super.key});

  @override
  _PerformanceEvaluationPageState createState() => _PerformanceEvaluationPageState();
}

class _PerformanceEvaluationPageState extends BaseState<PerformanceEvaluationPage> {
  late PerformanceEvaluationBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldPage(
      appbar: appBar(R.strings.performance_evaluation),
      body: BlocBuilder<PerformanceEvaluationBloc, PageState>(
        bloc: _bloc,
        builder: (context, state) => _builBody(state),
      ),
    );
  }

  @override
  void initState() {
    _setupBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close;
    super.dispose();
  }

  void _setupBloc() {
    _bloc = PerformanceEvaluationBloc();
    _bloc.listenAction(cancelSubOnDispose, (action) {
      switch (action) {
        case ActionLoaddataFaild():
          ToastUtils.showErrorToast(context, message: action.message);
      }
    });
  }

  Widget _builBody(PageState state) {
    return LoadingOverlay(
      isLoading: state.showLoading,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                R.strings.AI_driven_work_performance,
                style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text),
              ),
              SizedBox(
                height: 20,
              ),
              _buildItemScore(state),
              SizedBox(
                height: 20,
              ),
              Text(
                R.strings.Advice_for_you,
                style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text),
              ),
              SizedBox(
                height: 10,
              ),
              _builDescripTionAdvice(state),
              SizedBox(
                height: 15,
              ),
              _buildWorkperformance(state),
              SizedBox(
                height: 10,
              ),
              _buildDescripTionColumnChart(state),
              SizedBox(
                height: 20,
              ),
              Text(
                R.strings.event_of_you,
                style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text),
              ),
              SizedBox(
                height: 20,
              ),
              _buildListEventForUser(state)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemScore(PageState state) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        color: R.color.background_score,
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(R.strings.Achieved_score,
                    style: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.white)),
                SizedBox(
                  height: 30,
                ),
                state.evaluateSchedule == null
                    ? Text(R.strings.evaluationOfheath('N/A'),
                        style: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.white))
                    : Text(R.strings.evaluationOfheath(state.evaluateSchedule!.calendarHealth),
                        style: R.textStyle.inter_semibold_20_600.copyWith(color: R.color.white))
              ],
            ),
          ),
          // score
          state.evaluateSchedule == null
              ? Text('0/10',
                  style: R.textStyle.inter_semibold_24_600.copyWith(color: R.color.white))
              : Text('${state.evaluateSchedule!.overallScore.toString()}/10',
                  style: R.textStyle.inter_semibold_24_600.copyWith(color: R.color.white))
        ],
      ),
    );
  }

  Widget _builDescripTionAdvice(PageState state) {
    return state.evaluateSchedule == null
        ? Text('Nothing to here',
            style:
                R.textStyle.inter_regular_16_400.copyWith(color: R.color.textDescriptionFeddBack))
        : Text(state.evaluateSchedule!.advice,
            style:
                R.textStyle.inter_regular_16_400.copyWith(color: R.color.textDescriptionFeddBack));
  }

  Widget _buildWorkperformance(PageState state) {
    return state.evaluateSchedule == null
        ? EmptyListView(
            description: R.strings.There_is_no_chart_here,
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            height: 333,
            decoration: BoxDecoration(
                color: R.color.color_backGround_for_chart,
                border: Border.all(color: R.color.color_backGround_for_chart),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildColumnChart(
                    '${state.evaluateSchedule!.eventTime.workStudy}%',
                    calculateHeightColumn(state.evaluateSchedule!.eventTime.workStudy),
                    R.color.column1),
                _buildColumnChart(
                    '${state.evaluateSchedule!.eventTime.physicalHealth}%',
                    calculateHeightColumn(state.evaluateSchedule!.eventTime.physicalHealth),
                    R.color.column2),
                _buildColumnChart(
                    '${state.evaluateSchedule!.eventTime.entertainmentRelaxation}%',
                    calculateHeightColumn(
                        state.evaluateSchedule!.eventTime.entertainmentRelaxation),
                    R.color.column3),
                _buildColumnChart(
                    '${state.evaluateSchedule!.eventTime.others}%',
                    calculateHeightColumn(state.evaluateSchedule!.eventTime.others),
                    R.color.column4)
              ],
            ),
          );
  }

  Widget _buildColumnChart(String descripTion, double height, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 50,
          height: height,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: color),
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
        ),
        SizedBox(height: 10),
        Text(descripTion, style: R.textStyle.inter_semibold_14_600.copyWith(color: R.color.text))
      ],
    );
  }

  Widget _buildDescripTionColumnChart(PageState state) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      _descriptionColumChart('Work', R.color.column1),
      _descriptionColumChart('Relaxtion', R.color.column2),
      _descriptionColumChart('Physical health', R.color.column3),
      _descriptionColumChart('Other', R.color.column4),
    ]);
  }

  Widget _descriptionColumChart(String description, Color color) {
    return SizedBox(
      width: 60,
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(width: 3),
          Expanded(
            child: Text(
              description,
              style: R.textStyle.inter_medium_10_500.copyWith(color: R.color.text),
            ),
          ),
        ],
      ),
    );
  }

  // để build ra đoạn này cần có state sau đó sử dụng state.list
  Widget _buildListEventForUser(PageState state) {
    return state.evaluateSchedule == null
        ? EmptyListView(description: R.strings.No_event_here)
        : ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildItemEvent(state.evaluateSchedule!.prioriTyevents[index]);
            },
            separatorBuilder: (context, __) {
              return SizedBox(height: 15);
            },
            itemCount: state.evaluateSchedule!.prioriTyevents.length);
  }

  // đoạn này sẽ sử dụng từng giá trị bên trong state truyền vào
  Widget _buildItemEvent(String event) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: R.color.colorEventForUser,
          border: Border.all(color: R.color.colorEventForUser),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(color: R.color.fdd5d7),
                color: R.color.fdd5d7,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage(R.drawables.img_heart))),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(child: Text(event, style: R.textStyle.inter_medium_16_500.copyWith(color: R.color.text)))
        ],
      ),
    );
  }

  double calculateHeightColumn(double value) {
    return (260 * (value / 100)).clamp(0, 260);
  }
}
