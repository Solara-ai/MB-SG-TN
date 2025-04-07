import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/edit%20profile/edit_profile_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/profile/profile_bloc.dart';
import 'package:schedule_gen_and_time_management/src/utils/navigator_ultils.dart';
import 'package:schedule_gen_and_time_management/src/utils/toast_ultil.dart';
import 'package:schedule_gen_and_time_management/src/widgets/custom_appbar.dart';

class ProfliePage extends BasePage {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseState<ProfliePage> {
  late final ProfileBloc _bloc;

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
    _bloc = ProfileBloc();
    _bloc.listenAction(cancelSubOnDispose, (action) async {
      switch (action) {
        case ActionNavigateProFilePage():
          final result = await NavigatorUltils.navigatePage<bool>(context, EditProfilePage());
          if (result == true) {
            _bloc.add(InitilizeEvent());
          }
        case ActionGetMyprofileError():
          ToastUtils.showErrorToast(context, message: action.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, PageState>(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
        appBar: appBar(R.strings.profile, action: [
          GestureDetector(
            onTap: _navigatePage,
            child: Container(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                R.strings.edit,
                style: R.textStyle.inter_semibold_14_600.copyWith(color: R.color.text),
              ),
            ),
          )
        ]),
        backgroundColor: R.color.white,
        body: _builbodyProfile(state),
      ),
    );
  }

  void _navigatePage() {
    _bloc.add(EventNavigateEditProfilePage());
  }

  Widget _builbodyProfile(PageState state) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 100,
              height: 110,
              decoration: BoxDecoration(
                border: Border.all(color: R.color.colorBorder),
                shape: BoxShape.circle,
                color: Colors.grey.shade200, // background cho đẹp
              ),
              child: ClipOval(
                child: SvgPicture.asset(
                  R.drawables.ic_default_user, // đường dẫn SVG
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          state.userProfile?.fullName ?? '',
          style: R.textStyle.inter_medium_16_500.copyWith(color: R.color.text),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: R.color.colorBorder,
        ),
        SizedBox(height: 30),
        _buildInformationUser(state)
      ],
    );
  }

  Widget _buildInformationUser(PageState state) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            R.strings.about_you,
            style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text),
          ),
          SizedBox(
            height: 20,
          ),
          _builInformation(R.strings.gender, state.userProfile?.gender ?? ''),
          SizedBox(
            height: 24,
          ),
          _builInformation(R.strings.date_of_birth, state.userProfile?.birthday ?? ''),
          SizedBox(
            height: 30,
          ),
          Text(R.strings.more_about_you,
              style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text)),
          SizedBox(
            height: 20,
          ),
          _builInformation(R.strings.phone_number, state.userProfile?.phone ?? ''),
          SizedBox(
            height: 24,
          ),
          _builInformation(R.strings.email, state.userProfile?.email ?? ''),
          SizedBox(
            height: 24,
          ),
          _builInformation(R.strings.hobbies, state.userProfile?.hobbies ?? ''),
          SizedBox(
            height: 24,
          ),
          _builInformation(R.strings.occupation, state.userProfile?.occupation ?? ''),
        ],
      ),
    );
  }

  Widget _builInformation(String type, String displayValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(type, style: R.textStyle.inter_medium_16_500.copyWith(color: R.color.text)),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              displayValue,
              style:
                  R.textStyle.inter_regular_16_400.copyWith(color: R.color.textDescriptionFeddBack),
            ),
          ),
        )
      ],
    );
  }
}
