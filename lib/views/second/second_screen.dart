import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        verticalSpace(90),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(50)),
          child: Text('Explore',
              style: AppStyle.pageTitle,
          ),
        ),
        verticalSpace(60),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(50)),
          child: Text('For You',
            style: AppStyle.categoryBlackTitle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(50)),
          child: Text('Based on your bundles',
          style: AppStyle.greenSubtitle),
        ),
        Container(
          height: 80.0,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            children: new List.generate(10, (int index) {
              return new Card(
                color: Colors.blue[index * 100],
                child: new Container(
                  width: 50.0,
                  height: 50.0,
                  child: new Text("$index"),
                ),
              );
            }),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(100), right: adaptiveWidth(100)),
          child: Divider(
            height: ScreenUtil().setHeight(60),
            thickness: 1,
          ),
        ),
        Text('Categories',
          style: AppStyle.categoryBlackTitle,
        ),
      ],
    );
  }
}
