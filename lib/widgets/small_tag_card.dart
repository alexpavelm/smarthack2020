import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';

class SmallTagCard extends StatelessWidget {
  final String image;
  final String title;

  const SmallTagCard({Key key, this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: adaptiveHeight(30)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Stack(
          children: [
            Container(
              width: adaptiveWidth(900),
              height: adaptiveHeight(130),
              decoration: new BoxDecoration(
                color: const Color(0xff7c94b6),
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new AssetImage(image),
                ),
              ),
            ),
            Positioned(
              bottom: adaptiveHeight(25),
              left: adaptiveWidth(100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyle.categoryWhiteTitle),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
