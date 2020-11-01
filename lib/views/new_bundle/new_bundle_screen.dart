import 'package:baseapp/misc/colors.dart';
import 'package:baseapp/misc/fake_backend.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/models/bundle_model.dart';
import 'package:baseapp/widgets/small_tag_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewBundleScreen extends StatefulWidget {
  final BundleModel bundleModel;

  const NewBundleScreen(this.bundleModel);

  @override
  _NewBundleScreenState createState() => _NewBundleScreenState();
}

class _NewBundleScreenState extends State<NewBundleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: adaptiveWidth(90), right: adaptiveWidth(90)),
        child: ListView(
          children: [
            verticalSpace(90),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: adaptiveWidth(450),
                  child: Text(
                    this.widget.bundleModel.title,
                    style: AppStyle.pageTitle,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      myBundles.add(widget.bundleModel);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.lightGreen,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: adaptiveWidth(15),
                          horizontal: adaptiveWidth(50)),
                      child: Center(
                        child: myBundles.contains(widget.bundleModel) ? Row(
                          children: [
                            Text(
                              "SUBSCRIBED",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: adaptiveFont(45),
                                  fontWeight: FontWeight.w600),
                            ),
                            Icon(Icons.check, color: Colors.white, size: adaptiveWidth(40),)
                          ],
                        ) :Text(
                          "SUBSCRIBE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: adaptiveFont(45),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '\$',
                  style: AppStyle.greenSubtitle
                      .copyWith(fontSize: adaptiveFont(45)),
                ),
                Text(
                  this.widget.bundleModel.price,
                  style: AppStyle.greenSubtitle
                      .copyWith(fontSize: adaptiveFont(45)),
                ),
                Text(
                  ' a week',
                  style: AppStyle.greenSubtitle,
                ),
              ],
            ),
            verticalSpace(60),
            Row(
              children: [
                Text(
                  'A mix of ',
                  style: AppStyle.categoryBlackTitle,
                ),
                Text(
                  this.widget.bundleModel.objects.length.toString(),
                  style: AppStyle.categoryBlackTitle,
                ),
              ],
            ),
            verticalSpace(30),
            ...this
                .widget
                .bundleModel
                .objects
                .map((e) => SmallTagCard(image: e.image, title: e.title)),
            verticalSpace(30),
            Text(
              'More bundles like it...',
              style: AppStyle.categoryBlackTitle,
            ),
            verticalSpace(60),
          ],
        ),
      ),
    );
  }
}
