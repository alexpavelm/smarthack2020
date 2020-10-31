import 'package:baseapp/views/fourth/fourth_screen.dart';
import 'package:baseapp/views/home/home_screen.dart';
import 'package:baseapp/views/second/second_screen.dart';
import 'package:baseapp/views/third/third_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: new Scaffold(
            body: TabBarView(children: [
              HomeScreen(),
              SecondScreen(),
              ThirdScreen(),
              FourthScreen(),
            ]), // new
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.list),
                ),
                Tab(
                  icon: Icon(Icons.star),
                ),
                Tab(
                  icon: Icon(Icons.web),
                ),
                Tab(
                  icon: Icon(Icons.more_horiz),
                ),
              ],
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
