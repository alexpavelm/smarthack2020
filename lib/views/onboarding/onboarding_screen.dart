import 'package:baseapp/blocs/authentication/authentication_bloc.dart';
import 'package:baseapp/blocs/authentication/bloc.dart';
import 'package:baseapp/misc/colors.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentStep = 1;
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          onboardingStep(
              title: "Find cool trainer more text",
              subtitle:
                  "Discover the best trainer you want by your location or neighborhood",
              step: 1),
          onboardingStep(
              title: "Schedule the more text",
              subtitle:
                  "Determine the exact time between you and the trainer as needed",
              step: 2),
          onboardingStep(
              title: "Enjoy your more text",
              subtitle:
                  "Get an ideal healthy body from the training of your choice",
              step: 3),
        ],
      ),
    );
  }

  Widget onboardingStep({String title, String subtitle, int step}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.grey],
          stops: [0.01, 1],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              verticalSpace(120),
              step != 3
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Skip",
                          style: AppStyle.whiteText,
                        ),
                        horizontalSpace(40),
                      ],
                    )
                  : verticalSpace(45),
              Padding(
                padding: EdgeInsets.all(adaptiveWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(150),
                    Row(
                      children: [
                        SizedBox(
                          //TODO LOGO
                          height: adaptiveHeight(100),
                          width: adaptiveWidth(100),
                        ),
                        horizontalSpace(20),
                        Text(
                          "Fitflo",
                          style: AppStyle.logoText,
                        ),
                      ],
                    ),
                    verticalSpace(200),
                    Text(
                      title,
                      style: AppStyle.whiteTitle,
                    ),
                    verticalSpace(100),
                    Text(
                      subtitle,
                      style: AppStyle.whiteText,
                    ),
                    verticalSpace(170),
                    Row(
                      children: [
                        Text(
                          "0$step",
                          style: AppStyle.whiteText,
                        ),
                        Text(
                          " / 03",
                          style:
                              AppStyle.whiteText.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    verticalSpace(50),
                    StepProgressIndicator(
                      totalSteps: 3,
                      currentStep: step,
                      size: 2,
                      padding: 0,
                      selectedColor: AppColor.primary,
                      unselectedColor: Colors.grey,
                      roundedEdges: Radius.circular(10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(adaptiveWidth(80)),
                child: mainButton(
                    text: step == 3 ? "Get Started" : "Next",
                    onTap: () {
                      step != 3
                          ? controller.animateToPage(step,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear)
                          : BlocProvider.of<AuthenticationBloc>(context).add(FinishedOnBoarding());
                    }, width: 300),
              ),
              verticalSpace(50),
            ],
          ),
        ],
      ),
    );
  }
}
