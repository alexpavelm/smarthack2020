import 'package:baseapp/blocs/authentication/bloc.dart';
import 'package:baseapp/misc/colors.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                style: AppStyle.appSubtitle.copyWith(height: 0.8),
              ),
              Text(
                ".",
                style: AppStyle.appSubtitle.copyWith(color: AppColor.lightGreen, height: 0.8),
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
                    Row(
                      children: [
                        Text("REGISTER",
                        style: AppStyle.categoryWhiteTitle),
                      ],
                    ),
                    TextFormField(
                      controller: _usernameController,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: adaptiveFont(45),
                      ),
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(
                          color: Color(0xFF7D8699),
                          fontSize: adaptiveFont(40),
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.indigoAccent, width: 2)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFFF0F0F0), width: 2)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: adaptiveFont(45),
                      ),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Color(0xFF7D8699),
                          fontSize: adaptiveFont(40),
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.indigoAccent, width: 2)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFFF0F0F0), width: 2)),
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
                Text('or',
                  style: AppStyle.whiteSmallText,),
                verticalSpace(10),
                GestureDetector(
                  onTap: () {
                    setState(() {

                    });
                  },
                  child: Container(
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
    );
  }
}
