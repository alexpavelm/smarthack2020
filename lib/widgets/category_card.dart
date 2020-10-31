import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const CategoryCard({Key key, this.image, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Stack(
        children: [
          Container(
            width: adaptiveWidth(900),
            height: adaptiveHeight(340),
            decoration: new BoxDecoration(
              color: const Color(0xff7c94b6),
              image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.srcOver),
                image: new AssetImage(image),
              ),
            ),
          ),
          Positioned(
            bottom: adaptiveHeight(50),
            left: adaptiveWidth(80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyle.categoryWhiteTitle.copyWith(height: .4),),
                Text(subtitle, style: AppStyle.categoryWhiteSubtitle,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
