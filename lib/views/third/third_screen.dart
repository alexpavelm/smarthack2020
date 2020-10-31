import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/widgets/tag_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: adaptiveWidth(90), right: adaptiveWidth(90)),
      child: ListView(
        children: [
          verticalSpace(90),
          Text('My Bundles',
            style: AppStyle.pageTitle,
          ),
          verticalSpace(60),
          Column(
            children: [
            ]
          ),
          Padding(
            padding: EdgeInsets.only(left: adaptiveWidth(60), right: adaptiveWidth(60)),
            child: Divider(
              height: ScreenUtil().setHeight(60),
              thickness: 1,
            ),
          ),
          Column(),
        ],
      ),
    );
  }
}
