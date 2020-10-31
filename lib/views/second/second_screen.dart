import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        verticalSpace(90),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(90)),
          child: Text('Explore',
              style: AppStyle.pageTitle,
          ),
        ),
        verticalSpace(60),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(90)),
          child: Text('For You',
            style: AppStyle.categoryBlackTitle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(90)),
          child: Text('Based on your bundles',
          style: AppStyle.greenSubtitle),
        ),
        verticalSpace(30),
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
          padding: EdgeInsets.only(left: adaptiveWidth(150), right: adaptiveWidth(150)),
          child: Divider(
            height: ScreenUtil().setHeight(60),
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(90)),
          child: Text('Categories',
            style: AppStyle.categoryBlackTitle,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(30),
            CategoryCard(image: '', title: 'Image', subtitle: 'Subtitle'),
            verticalSpace(60),
            CategoryCard(image: '', title: 'Image2', subtitle: 'Subtitle23'),
            verticalSpace(60),
            CategoryCard(image: '', title: 'Image3', subtitle: 'Subtitle3'),
          ],
        )
      ],
    );
  }
}
