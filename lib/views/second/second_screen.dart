import 'package:animations/animations.dart';
import 'package:baseapp/misc/fake_backend.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/models/category_model.dart';
import 'package:baseapp/views/fourth/fourth_screen.dart';
import 'package:baseapp/widgets/category_card.dart';
import 'package:baseapp/widgets/small_bundle_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        verticalSpace(90),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(90)),
          child: Text('Explore',
              style: AppStyle.pageTitle,
          ),
        ),
        verticalSpace(60),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(90)),
          child: Text('For You',
            style: AppStyle.categoryBlackTitle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(90)),
          child: Text('Based on your bundles',
          style: AppStyle.greenSubtitle),
        ),
        verticalSpace(30),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(90), right: adaptiveWidth(90)),
          child: Container(
            height: adaptiveWidth(300),
            child: new ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SmallBundleCard(image: "assets/images/essentials.jpg", title: 'Fruit Pack'),
                horizontalSpace(30),
                SmallBundleCard(image: "assets/images/essentials.jpg", title: 'Veggies'),
                horizontalSpace(30),
                SmallBundleCard(image: "assets/images/essentials.jpg", title: 'Meat & Fish'),
                horizontalSpace(30),
                SmallBundleCard(image: "assets/images/essentials.jpg", title: 'Fruit Pack'),
              ]
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(150), right: adaptiveWidth(150)),
          child: Divider(
            height: ScreenUtil().setHeight(60),
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(90)),
          child: Text('Categories',
            style: AppStyle.categoryBlackTitle,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: categories.map((e) => _OpenContainerWrapper(
            categoryModel: e,
            transitionType: _transitionType,
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return CategoryCard(categoryModel: e, openContainer: openContainer);
            },
          )).toList(),
        )
      ],
    );
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    this.closedBuilder,
    this.transitionType,
    this.onClosed,
    this.categoryModel,
  });

  final CategoryModel categoryModel;
  final OpenContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool> onClosed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(adaptiveHeight(30)),
      child: OpenContainer<bool>(
        transitionType: transitionType,
        closedElevation: 0,
        closedColor: Theme.of(context).scaffoldBackgroundColor,
        openBuilder: (BuildContext context, VoidCallback _) {
          return FourthScreen(categoryModel: categoryModel,);
        },
        onClosed: onClosed,
        tappable: false,
        closedBuilder: closedBuilder,
      ),
    );
  }
}
