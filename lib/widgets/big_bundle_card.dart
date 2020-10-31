import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/models/bundle_model.dart';
import 'package:baseapp/models/bundle_object_model.dart';
import 'package:baseapp/views/bundle/bundle_screen.dart';
import 'package:baseapp/widgets/bundle_tag_container.dart';
import 'package:flutter/material.dart';

class BigBundleCard extends StatelessWidget {
  final BundleModel bundleModel;

  const BigBundleCard(
      {Key key, this.bundleModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bundleModel.isSubscribed
        ? Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => BundlePage(bundleModel)),
        )
       : Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => BundlePage(bundleModel)),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Stack(
          children: [
            Container(
              width: adaptiveWidth(900),
              height: adaptiveHeight(400),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new AssetImage(bundleModel.image),
                ),
              ),
            ),
            Positioned(
              top: adaptiveHeight(100),
              left: adaptiveWidth(80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bundleModel.title,
                    style: AppStyle.bigBundleTitle.copyWith(height: .6),
                  ),
                  Text(
                    bundleModel.isSubscribed ? bundleModel.subtitle : "\$${bundleModel.price} a week",
                    style: AppStyle.bigBundleSubtitle,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: adaptiveWidth(65),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: adaptiveWidth(500),
                    height: adaptiveWidth(200),
                    child: Wrap(
                          children: [...bundleModel.objects.take(3).map((e) => Padding(
                            padding: EdgeInsets.all(adaptiveWidth(10)),
                            child: BundleTagContainer(bundleTagModel: e,),
                          )).toList(), ...[Padding(
                            padding: EdgeInsets.all(adaptiveWidth(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: adaptiveWidth(7), horizontal: adaptiveWidth(25)),
                                child: Text("+${bundleModel.objects.length - 3} more", style: AppStyle.bundleTag.copyWith(color: Colors.white),),
                              ),
                            ),
                          )]],
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
