import 'package:baseapp/misc/colors.dart';
import 'package:baseapp/views/explore/explore_screen.dart';
import 'package:baseapp/views/category/category_screen.dart';
import 'package:baseapp/views/trending/trending_screen.dart';
import 'package:baseapp/views/my_bundles/my_bundles_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: new Scaffold(
            body: TabBarView(children: [
              TrendingScreen(),
              ExploreScreen(),
              MyBundlesScreen(),
            ]), // new
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.chartLine),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.compass),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.shoppingCart),
                ),
              ],
              labelColor: AppColor.lightGreen,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
