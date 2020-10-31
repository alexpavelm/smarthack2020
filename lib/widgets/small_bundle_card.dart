import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';

class SmallBundleCard extends StatelessWidget {
  final String image;
  final String title;

  const SmallBundleCard({Key key, this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        children: [
          Container(
              width: adaptiveWidth(300),
              height: adaptiveWidth(300),
              child: Image.asset(
                image,
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
                Text(
                  title,
                  style: AppStyle.smallBundleTitle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
