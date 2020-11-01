import 'package:baseapp/misc/colors.dart';
import 'package:baseapp/misc/fake_backend.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/models/bundle_model.dart';
import 'package:baseapp/models/bundle_object_model.dart';
import 'package:baseapp/views/bundle/bundle_screen.dart';
import 'package:baseapp/views/new_bundle/new_bundle_screen.dart';
import 'package:baseapp/widgets/bundle_tag_container.dart';
import 'package:flutter/material.dart';

class BigBundleSubscribeCard extends StatefulWidget {
  final BundleModel bundleModel;
  final Function onTap;

  const BigBundleSubscribeCard(
      {Key key, this.bundleModel, this.onTap})
      : super(key: key);

  @override
  _BigBundleSubscribeCardState createState() => _BigBundleSubscribeCardState();
}

class _BigBundleSubscribeCardState extends State<BigBundleSubscribeCard> {
  bool isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myBundles.contains(widget.bundleModel)
        ? Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => BundlePage(widget.bundleModel)),
        )
       : Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => NewBundleScreen(widget.bundleModel)),
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
                  image: new AssetImage(widget.bundleModel.image),
                ),
              ),
            ),
            Positioned(
              top: adaptiveHeight(50),
              left: adaptiveWidth(80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width:adaptiveWidth(500),
                    child: Text(
                      widget.bundleModel.title,
                      style: AppStyle.bigBundleTitle.copyWith(height: .8),
                    ),
                  ),
                  Text(
                    myBundles.contains(widget.bundleModel) ? widget.bundleModel.subtitle : "\$${widget.bundleModel.price} a week",
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
                          children: [...widget.bundleModel.objects.take(3).map((e) => Padding(
                            padding: EdgeInsets.all(adaptiveWidth(10)),
                            child: BundleTagContainer(bundleTagModel: e,),
                          )).toList(), ...[Padding(
                            padding: EdgeInsets.all(adaptiveWidth(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: adaptiveWidth(7), horizontal: adaptiveWidth(25)),
                                child: Text("+${widget.bundleModel.objects.length - 3} more", style: AppStyle.bundleTag.copyWith(color: Colors.white),),
                              ),
                            ),
                          )]],
                        ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: adaptiveWidth(40),
              top: adaptiveWidth(50),
              child: GestureDetector(
                onTap: () {
                  if (!myBundles.contains(widget.bundleModel)) {
                    myBundles.add(widget.bundleModel);
                  } else {
                    myBundles.remove(widget.bundleModel);
                  }
                  Future.delayed(Duration(milliseconds: 500), () {
                    setState(() {
                      isSubscribed = !isSubscribed;
                    });
                  });
                  widget.onTap();
                } ,
                child: Container(
                  height: adaptiveHeight(100),
                  width: adaptiveWidth(300),
                  decoration: new BoxDecoration(
                      color: AppColor.lightGreen,
                      borderRadius: new BorderRadius.all(
                        Radius.circular(30.0),
                      )),
                  child: Center(
                    child: isSubscribed ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SUBSCRIBED",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: adaptiveFont(35),
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.check, color: Colors.white, size: adaptiveWidth(40),)
                      ],
                    ) : Text(
                    "SUBSCRIBE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: adaptiveFont(35),
                        fontWeight: FontWeight.w600),
                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
