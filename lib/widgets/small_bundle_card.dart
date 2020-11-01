import 'package:baseapp/misc/fake_backend.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/models/bundle_model.dart';
import 'package:baseapp/views/bundle/bundle_screen.dart';
import 'package:baseapp/views/new_bundle/new_bundle_screen.dart';
import 'package:flutter/material.dart';

class SmallBundleCard extends StatelessWidget {
  final BundleModel bundleModel;

  const SmallBundleCard({Key key, this.bundleModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        forYouBundles.contains(bundleModel)
            ? Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BundlePage(bundleModel)),
        ) : Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => NewBundleScreen(bundleModel)),
        );
      },

      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Container(
                width: adaptiveWidth(300),
                height: adaptiveWidth(300),
                child: Image.asset(
                  bundleModel.image,
                  fit: BoxFit.cover,
                )),
            Positioned(
              child: Container(
                width: adaptiveWidth(300),
                height: adaptiveWidth(300),
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.white.withOpacity(0.7), Colors.transparent],
                    stops: [0.1, 1],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: adaptiveHeight(25),
              left: adaptiveWidth(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: adaptiveWidth(300),
                    height: adaptiveWidth(300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          bundleModel.title,
                          style: AppStyle.smallBundleTitle,
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
