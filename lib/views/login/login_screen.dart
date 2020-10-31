import 'package:baseapp/blocs/authentication/bloc.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0, bottom: 80),
              child: Text(
                "tagster",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 45),
            child: Column(
              children: <Widget>[
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mainButton(
                  onTap: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedIn());
                  },
                  text: "Login",
                  width: 400),
            ],
          ),
        ],
      ),
    );
  }
}
