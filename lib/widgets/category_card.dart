import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  final Function openContainer;

  const CategoryCard({Key key, this.categoryModel, this.openContainer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openContainer,
      child: ClipRRect(
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
                  //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.srcOver),
                  image: new AssetImage(categoryModel.image),
                ),
              ),
            ),
            Positioned(
              bottom: adaptiveHeight(50),
              left: adaptiveWidth(80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(categoryModel.title, style: AppStyle.categoryWhiteTitle.copyWith(height: .4),),
                  Text(categoryModel.subtitle, style: AppStyle.categoryWhiteSubtitle,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
