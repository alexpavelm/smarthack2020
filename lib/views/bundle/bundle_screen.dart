import 'package:baseapp/misc/fake_backend.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/models/bundle_model.dart';
import 'package:baseapp/models/bundle_object_model.dart';
import 'package:baseapp/widgets/big_bundle_card.dart';
import 'package:baseapp/widgets/bundle_suggestion_container.dart';
import 'package:baseapp/widgets/tag_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BundlePage extends StatefulWidget {
  final BundleModel bundleModel;

  const BundlePage(this.bundleModel);

  @override
  _BundlePageState createState() => _BundlePageState();
}

class _BundlePageState extends State<BundlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: adaptiveWidth(90), right: adaptiveWidth(90)),
        child: ListView(
          children: [
            verticalSpace(90),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(this.widget.bundleModel.title,
                  style: AppStyle.pageTitle,
                ),
                Icon(Icons.settings),
              ],
            ),
            verticalSpace(60),
            ...this.widget.bundleModel.objects.map((e) => TagCard(image: e.image, title: e.title, subtitle: e.subtitle)),
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
                  BigBundleCard(bundleModel: fruitBundle1),
                  verticalSpace(60),
                  BigBundleCard(bundleModel: fruitBundle1),
                  verticalSpace(60),
                  BigBundleCard(bundleModel: fruitBundle1),
                ]
            ),
          ],
        ),
      ),
    );
  }
}
