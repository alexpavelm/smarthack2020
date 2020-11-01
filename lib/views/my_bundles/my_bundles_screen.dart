import 'package:baseapp/misc/fake_backend.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/widgets/big_bundle_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class MyBundlesScreen extends StatefulWidget {
  @override
  _MyBundlesScreenState createState() => _MyBundlesScreenState();
}

class _MyBundlesScreenState extends State<MyBundlesScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: myBundles.map((e) => Padding(
              padding: EdgeInsets.only(bottom: adaptiveWidth(60)),
              child: BigBundleCard(bundleModel: e,),
            )).toList(
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: adaptiveWidth(60), right: adaptiveWidth(60)),
            child: Divider(
              height: ScreenUtil().setHeight(120),
              thickness: 1,
            ),
          ),
          Text('You might like...',
            style: AppStyle.categoryBlackTitle,
          ),
          verticalSpace(30),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BigBundleCard(bundleModel: fruitBundle1),
                verticalSpace(60),
                BigBundleCard(bundleModel: fruitBundle2),
                verticalSpace(60),
                BigBundleCard(bundleModel: fruitBundle3),
              ]
          ),
        ],
      ),
    );
  }
}
