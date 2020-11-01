import 'package:baseapp/blocs/authentication/authentication_bloc.dart';
import 'package:baseapp/blocs/authentication/bloc.dart';
import 'package:baseapp/misc/colors.dart';
import 'package:baseapp/misc/fake_backend.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/widgets/big_bundle_card.dart';
import 'package:baseapp/widgets/small_clickable_card.dart';
import 'package:baseapp/widgets/small_tag_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PreferencesOnBoardingScreen extends StatefulWidget {
  @override
  _PreferencesOnBoardingScreenState createState() =>
      _PreferencesOnBoardingScreenState();
}

class _PreferencesOnBoardingScreenState
    extends State<PreferencesOnBoardingScreen> {
  int currentStep = 1;
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          Container(
            child: Column(
              children: [
                Column(
                  children: [
                    verticalSpace(150),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: adaptiveWidth(90)),
                          child: Container(
                            width: adaptiveWidth(600),
                            child: Text(
                              'Quick! Pick three!',
                              style: AppStyle.pageTitle,
                            ),
                          ),
                        ),
                      ],
                    ),
                        verticalSpace(50),
                        ...fruitBundle1.objects.map((e) => SmallClickableCard(image: e.image, title: e.title)).toList(),
                  ],
                ),
                verticalSpace(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    button(currentStep),
                    horizontalSpace(50),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Column(
                  children: [
                    verticalSpace(150),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: adaptiveWidth(90)),
                          child: Container(
                            width: adaptiveWidth(600),
                            child: Text(
                              'Any preferences?',
                              style: AppStyle.pageTitle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(50),
                    ...fruitBundle1.objects.map((e) => SmallClickableCard(image: e.image, title: e.title)).toList(),
                  ],
                ),
                verticalSpace(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    button(currentStep),
                    horizontalSpace(50),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Column(
                  children: [
                    verticalSpace(150),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: adaptiveWidth(90)),
                          child: Container(
                            width: adaptiveWidth(600),
                            child: Text(
                              "We've selected a few for you",
                              style: AppStyle.pageTitle.copyWith(height: 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(50),
                    ...categories[0].bundles.take(3).map((e) => Padding(
                      padding: EdgeInsets.only(bottom: adaptiveWidth(30)),
                      child: BigBundleCard(bundleModel: e,),
                    )).toList(),
                  ],
                ),
                verticalSpace(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    button(currentStep),
                    horizontalSpace(50),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget button(int step) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentStep++;

        });
        print(step);
        step != 3
            ? controller.animateToPage(step,
                duration: Duration(milliseconds: 300), curve: Curves.linear)
            : BlocProvider.of<AuthenticationBloc>(context)
                .add(FinishedOnBoarding());
      },
      child: Container(
        height: adaptiveHeight(100),
        decoration: new BoxDecoration(
            color: AppColor.lightGreen,
            borderRadius: new BorderRadius.all(
              Radius.circular(30.0),
            )),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: adaptiveWidth(40), vertical: adaptiveWidth(20)),
            child: Text(
              step == 3 ? "I WANT FOOD!" : "NEXT",
              style: AppStyle.button,
            ),
          ),
        ),
      ),
    );
  }
}
