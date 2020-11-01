import 'dart:async';

import 'package:baseapp/blocs/authentication/bloc.dart';
import 'package:baseapp/misc/colors.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
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
              ListView(
                children: <Widget>[
                  verticalSpace(270),
                  Row(
                    children: [
                      horizontalSpace(75),
                      Text(
                        "re",
                        style: AppStyle.appTitle.copyWith(height: 0.8),
                      ),
                      Text(
                        "j",
                        style: AppStyle.appTitle.copyWith(color: AppColor.lightGreen, height: 0.8),
                      ),
                      Text(
                        "oo",
                        style: AppStyle.appTitle.copyWith(height: 0.8),
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
                        style: AppStyle.appSubtitle.copyWith(height: 1),
                      ),
                      Text(
                        ".",
                        style: AppStyle.appSubtitle.copyWith(color: AppColor.lightGreen, height: 1),
                      ),
                    ],
                  ),
                  verticalSpace(80),
                  Padding(
                    padding: EdgeInsets.only(left: adaptiveWidth(220), right: adaptiveWidth(220)),
                    child: Column(
                      children: [
                        Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _usernameController,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: adaptiveFont(45),
                                color: AppColor.lightGrey,
                              ),
                              decoration: InputDecoration(
                                labelText: "Username",
                                labelStyle: TextStyle(
                                  color: AppColor.lightGrey,
                                  fontSize: adaptiveFont(40),
                                  fontWeight: FontWeight.w400,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.lightGrey, width: 2)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.lightGrey, width: 2)),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: adaptiveFont(45),
                                color: AppColor.lightGrey,
                              ),
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: AppColor.lightGrey,
                                  fontSize: adaptiveFont(40),
                                  fontWeight: FontWeight.w400,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.lightGrey, width: 2)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.lightGrey, width: 2)),
                              ),
                              obscureText: true,
                              autocorrect: false,
                            ),
                          ],
                        ),
                        verticalSpace(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {

                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.lightGreen,
                                    borderRadius: BorderRadius.all(Radius.circular(30))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: adaptiveWidth(15),
                                      horizontal: adaptiveWidth(50)),
                                  child: Center(
                                    child: Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: adaptiveFont(45),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(LoggedIn());
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.lightGrey,
                                    borderRadius: BorderRadius.all(Radius.circular(30))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: adaptiveWidth(15),
                                      horizontal: adaptiveWidth(50)),
                                  child: Center(
                                    child: Text(
                                      "LOG IN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: adaptiveFont(45),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(20),
                        Text('or',
                          style: AppStyle.whiteSmallText.copyWith(color: Colors.white70, fontWeight: FontWeight.w600),),
                        verticalSpace(30),
                        GestureDetector(
                          onTap: () {
                            setState(() {

                            });
                          },
                          child: Container(
                            height: adaptiveHeight(90),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: adaptiveWidth(15),
                                  horizontal: adaptiveWidth(50)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(FontAwesomeIcons.facebook,
                                      color: Colors.white,
                                      size: 17),
                                  horizontalSpace(20),
                                  Text(
                                    "Sing in with Facebook",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: adaptiveFont(40),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        verticalSpace(30),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                            });
                          },
                          child: Container(
                            height: adaptiveHeight(90),
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: adaptiveWidth(15),
                                  horizontal: adaptiveWidth(50)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(FontAwesomeIcons.google,
                                      color: Colors.white,
                                      size: 17),
                                  horizontalSpace(20),
                                  Text(
                                    "Sing in with Google",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: adaptiveFont(40),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        verticalSpace(30),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                            });
                          },
                          child: Container(
                            height: adaptiveHeight(90),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: adaptiveWidth(15),
                                  horizontal: adaptiveWidth(50)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(FontAwesomeIcons.apple,
                                  color: Colors.white,
                                  size: 17),
                                  horizontalSpace(20),
                                  Text(
                                    "Sign in with Apple",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: adaptiveFont(40),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
