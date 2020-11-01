import 'package:baseapp/blocs/authentication/authentication_bloc.dart';
import 'package:baseapp/blocs/authentication/bloc.dart';
import 'package:baseapp/misc/colors.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PersonalityOnBoardingScreen extends StatefulWidget {
  @override
  _PersonalityOnBoardingScreenState createState() =>
      _PersonalityOnBoardingScreenState();
}

class _PersonalityOnBoardingScreenState
    extends State<PersonalityOnBoardingScreen> {
  final controller = PageController(initialPage: 0);
  double currentPage = 0;
  String text = "THE NUTRITION NERD";

  @override
  void initState() {
    controller.addListener(() {
      if (controller.page == 0) {
        setState(() {
          currentPage = 0;
          text = "THE NUTRITION NERD";
        });
      } else if (controller.page == 1) {
        setState(() {
          currentPage = 1;
          text = "THE CREATIVE COOK";
        });
      } else if (controller.page == 2) {
        setState(() {
          currentPage = 2;
          text = "THE DAILY DILETTANTE";
        });
      } else if (controller.page == 3) {
        setState(() {
          currentPage = 3;
          text = "THE GOURMET GENTLE";
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(150),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: adaptiveWidth(90)),
                child: Container(
                  width: adaptiveWidth(600),
                  child: Text('Who do you identify with?',
                    style: AppStyle.pageTitle,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(100),
          Container(
            height: adaptiveHeight(1150),
            child: PageView(
              controller: controller,
              children: [
                Image.asset("assets/images/onboarding_nerd.png"),
                Image.asset("assets/images/onboarding_cook.png"),
                Image.asset("assets/images/onboarding_gentle.png"),
                Image.asset("assets/images/onboarding_gentle.png"),
              ],
            ),
          ),
          DotsIndicator(
            dotsCount: 4,
            position: currentPage,
            decorator: DotsDecorator(
              color: Colors.grey, // Inactive color
              activeColor: AppColor.lightGreen,
            ),
          ),
          verticalSpace(20),
          GestureDetector(
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context).add(GoToPreferencesOnBoarding());
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
                  text,
                  style: AppStyle.button,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
