import 'dart:async';

import 'package:baseapp/blocs/authentication/authentication_bloc.dart';
import 'package:baseapp/blocs/authentication/authentication_state.dart';
import 'package:baseapp/blocs/authentication/bloc.dart';
import 'package:baseapp/misc/colors.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class FirstLaunchScreen extends StatefulWidget {
  @override
  _FirstLaunchScreenState createState() => _FirstLaunchScreenState();
}

class _FirstLaunchScreenState extends State<FirstLaunchScreen> {
  VideoPlayerController _controller;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/vid.mp4")
      ..initialize().then((_) {
        _controller.setLooping(true);
        Timer(Duration(milliseconds: 100), () {
          setState(() {
            _controller.play();
            _visible = true;
          });
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 1000),
            child: Container(
              height: adaptiveHeight(1920),
              child: _controller.value.initialized
                  ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
                  : Container(),
            ),
          ),
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
                        style: AppStyle.appTitle
                            .copyWith(color: AppColor.lightGreen),
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
                        style: AppStyle.appSubtitle
                            .copyWith(color: AppColor.lightGreen),
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
                        style: AppStyle.appSubtitle
                            .copyWith(color: AppColor.lightGreen),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(GoToPersonalityOnBoarding());
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
                  verticalSpace(200)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    if (_controller != null) {
      _controller.dispose();
      _controller = null;
    }
  }
}
