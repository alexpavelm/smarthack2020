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
      children: <Widget>[
        verticalSpace(50),
        Text('Explore'
        ),
        verticalSpace(40),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('For You'
          ),
        ),
        Text('Based on your bundles'),
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
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            height: ScreenUtil().setHeight(30),
          ),
        ),
        Text('Categories'),
      ],
    );
  }
}
