import 'package:baseapp/blocs/authentication/bloc.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Center(
            child: Text("Home Screen"),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mainButton(
                onTap: () {
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(LoggedOut());
                },
                text: "Logout",
                width: 400),
          ],
        ),
      ],
    );
  }
}
