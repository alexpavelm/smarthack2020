import 'package:baseapp/misc/fake_backend.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/widgets/big_bundle_card.dart';
import 'package:baseapp/widgets/bundle_suggestion_container.dart';
import 'package:baseapp/widgets/tag_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BundlePage extends StatefulWidget {
  @override
  _BundlePageState createState() => _BundlePageState();
}

class _BundlePageState extends State<BundlePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: adaptiveWidth(90), right: adaptiveWidth(90)),
      child: ListView(
        children: [
          verticalSpace(90),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Fruit Pack',
                style: AppStyle.pageTitle,
              ),
              Icon(Icons.settings),
            ],
          ),
          verticalSpace(60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TagCard(image: '', title: 'Oranges', subtitle: '40% had this'),
              verticalSpace(30),
              TagCard(image: '', title: 'Oranges', subtitle: '40% had this'),
              verticalSpace(30),
              TagCard(image: '', title: 'Oranges', subtitle: '40% had this'),
              verticalSpace(30),
              TagCard(image: '', title: 'Oranges', subtitle: '40% had this'),
            ],
          ),
          verticalSpace(30),
          Text('For next week...',
            style: AppStyle.categoryBlackTitle,
          ),
          verticalSpace(30),
          Wrap(
            children: [
              BundleSuggestionContainer(title: 'Make it sweeter'),
              BundleSuggestionContainer(title: 'Make it lemony'),
              BundleSuggestionContainer(title: 'Mix it up'),
              BundleSuggestionContainer(title: 'Surprize'),
              BundleSuggestionContainer(title: 'Repeat'),
            ],
          ),
          verticalSpace(30),
          Text('More bundles like it...',
            style: AppStyle.categoryBlackTitle,
          ),
          verticalSpace(30),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BigBundleCard(bundleModel: fruitBundle[0]),
                verticalSpace(60),
                BigBundleCard(bundleModel: fruitBundle[0]),
                verticalSpace(60),
                BigBundleCard(bundleModel: fruitBundle[0]),
              ]
          ),
        ],
      ),
    );
  }
}
