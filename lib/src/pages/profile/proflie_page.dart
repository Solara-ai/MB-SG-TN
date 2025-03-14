import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/widgets/custom_appbar.dart';

class ProfliePage extends BasePage {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseState<ProfliePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(R.strings.profile, action: [
        GestureDetector(
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
      body: _builbodyProfile(),
    );
  }

  Widget _builbodyProfile() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 100,
              height: 110,
              decoration: BoxDecoration(
                border: Border.all(color: R.color.bfbfbf),
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(R.drawables.user) , fit: BoxFit.cover)
              ),
            ),
            Positioned(
              top: 70,
              left: 60,
              child: GestureDetector(
                onTap: () {
                  print("Edit button clicked");
                },
                child: Container(
                  padding: EdgeInsets.all(7),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: R.color.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                    border: Border.all(color: R.color.white),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SvgPicture.asset(R.drawables.ic_edit_2),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'Lam Phuc',
          style: R.textStyle.inter_medium_16_500.copyWith(color: R.color.text),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: R.color.bfbfbf,
        ),
        SizedBox(height: 30),
        _buildInformationUser()
      ],
    );
  }

  Widget _buildInformationUser() {
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
          _builInformation(R.strings.gender, 'N/A'),
          SizedBox(
            height: 24,
          ),
          _builInformation(R.strings.date_of_birth, '14/7/2004'),
          SizedBox(
            height: 30,
          ),
          Text(R.strings.more_about_you,
              style: R.textStyle.inter_semibold_18_600.copyWith(color: R.color.text)),
          SizedBox(
            height: 20,
          ),
          _builInformation(R.strings.phone_number, '0971532900'),
          SizedBox(
            height: 24,
          ),
          _builInformation(R.strings.email, 'vulamPhuck16@gmail.com'),
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
                  style: R.textStyle.inter_regular_16_400
                      .copyWith(color: R.color.textDescriptionFeddBack),
                )))
      ],
    );
  }
}
