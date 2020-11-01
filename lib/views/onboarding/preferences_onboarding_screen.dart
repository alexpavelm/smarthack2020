import 'package:baseapp/blocs/authentication/authentication_bloc.dart';
import 'package:baseapp/blocs/authentication/bloc.dart';
import 'package:baseapp/misc/colors.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PreferencesOnBoardingScreen extends StatefulWidget {
  @override
  _PreferencesOnBoardingScreenState createState() => _PreferencesOnBoardingScreenState();
}

class _PreferencesOnBoardingScreenState extends State<PreferencesOnBoardingScreen> {
  int currentStep = 1;
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [

        ],
      ),
    );
  }

  Widget button(int step) {
    return GestureDetector(
        onTap: () {
          step != 3
              ? controller.animateToPage(step,
              duration: Duration(milliseconds: 300),
              curve: Curves.linear)
              : BlocProvider.of<AuthenticationBloc>(context).add(FinishedOnBoarding());
        },
      child: Container(
        height: adaptiveHeight(100),
        width: adaptiveWidth(600),
        decoration: new BoxDecoration(
            color: AppColor.lightGreen,
            borderRadius: new BorderRadius.all(
              Radius.circular(30.0),
            )),
        child: Center(
          child: Text(
            step == 3 ? "I WANT FOOD!" : "Next",
            style: AppStyle.button,
          ),
        ),
      ),
    );
  }
}
