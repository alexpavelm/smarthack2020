import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/widgets/category_card.dart';
import 'package:baseapp/widgets/small_bundle_card.dart';
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
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(90), right: adaptiveWidth(90)),
          child: Container(
            height: adaptiveHeight(300),
            child: new ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SmallBundleCard(image: '', title: 'Fruit Pack'),
                horizontalSpace(30),
                SmallBundleCard(image: '', title: 'Veggies'),
                horizontalSpace(30),
                SmallBundleCard(image: '', title: 'Meat & Fish'),
                horizontalSpace(30),
                SmallBundleCard(image: '', title: 'Fruit Pack'),
              ]
            ),
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
            CategoryCard(image: '', title: 'Essentials', subtitle: 'Wild variety for wild tastes'),
            verticalSpace(60),
            CategoryCard(image: '', title: 'Cooking Adventure', subtitle: 'Discover your undiscovered talents'),
            verticalSpace(60),
            CategoryCard(image: '', title: 'Gym It Up', subtitle: 'Discover your undiscovered talents'),
          ],
        )
      ],
    );
  }
}
