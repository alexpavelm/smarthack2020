import 'package:baseapp/blocs/authentication/authentication_bloc.dart';
import 'package:baseapp/blocs/authentication/authentication_state.dart';
import 'package:baseapp/blocs/authentication/bloc.dart';
import 'package:baseapp/misc/colors.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstLaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: adaptiveHeight(1920),
            width: MediaQuery.of(context).size.width,
              child: Image.asset(
            "assets/images/background.png",
                fit: BoxFit.cover,
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  verticalSpace(300),
                  Row(
                    children: [
                      horizontalSpace(75),
                      Text(
                        "re",
                        style: AppStyle.appTitle,
                      ),
                      Text(
                        "j",
                        style: AppStyle.appTitle.copyWith(color: AppColor.lightGreen),
                      ),
                      Text(
                        "oo",
                        style: AppStyle.appTitle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      horizontalSpace(75),
                      Text(
                        "Eating",
                        style: AppStyle.appSubtitle,
                      ),
                      Text(
                        ".",
                        style: AppStyle.appSubtitle.copyWith(color: AppColor.lightGreen),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      horizontalSpace(75),
                      Text(
                        "Redefined",
                        style: AppStyle.appSubtitle,
                      ),
                      Text(
                        ".",
                        style: AppStyle.appSubtitle.copyWith(color: AppColor.lightGreen),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [GestureDetector(
                  onTap: () {
                    BlocProvider.of<AuthenticationBloc>(context).add(GoToPersonalityOnBoarding());
                  },
                  child: Container(
                    height: adaptiveHeight(125),
                    width: adaptiveWidth(600),
                    decoration: new BoxDecoration(
                        color: AppColor.lightGreen,
                        borderRadius: new BorderRadius.all(
                          Radius.circular(30.0),
                        )),
                    child: Center(
                      child: Text(
                        "GET STARTED NOW",
                        style: AppStyle.button,
                      ),
                    ),
                  ),
                ),
                verticalSpace(200)],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
