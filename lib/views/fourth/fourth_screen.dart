import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/models/category_model.dart';
import 'package:baseapp/widgets/big_bundle_card.dart';
import 'package:flutter/material.dart';

class FourthScreen extends StatefulWidget {
  final CategoryModel categoryModel;

  const FourthScreen({Key key, this.categoryModel}) : super(key: key);

  @override
  _FourthScreenState createState() => _FourthScreenState(categoryModel);
}

class _FourthScreenState extends State<FourthScreen> {
  final CategoryModel categoryModel;

  _FourthScreenState(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0.8),
                      Colors.transparent
                    ],
                    stops: [
                      0,
                      0.05,
                      0.5
                    ]).createShader(
                    Rect.fromLTRB(0, -140, rect.width, rect.height - 20));
              },
              blendMode: BlendMode.srcOver,
              child: Container(
                height: adaptiveHeight(500),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(categoryModel.image),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: adaptiveWidth(100)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryModel.title,
                style: AppStyle.pageTitle,
              ),
              Text(
                categoryModel.subtitle,
                style: AppStyle.categoryGreySubtitle,
              ),
              ...categoryModel.bundles
                  .map((e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: adaptiveWidth(30)),
                    child: BigBundleCard(
                          bundleModel: e,
                        ),
                  ))
                  .toList(),
            ],
          ),
        )
      ],
    );
  }
}
