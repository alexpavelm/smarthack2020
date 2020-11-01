import 'package:baseapp/blocs/authentication/bloc.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/widgets/trend_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        verticalSpace(90),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(90)),
          child: Text(
            'Trends',
            style: AppStyle.pageTitle,
          ),
        ),
        verticalSpace(60),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(90)),
          child: Text(
            '#fruitpack',
            style: AppStyle.categoryBlackTitle,
          ),
        ),
        verticalSpace(30),
        Padding(
          padding: EdgeInsets.only(
              left: adaptiveWidth(65), right: adaptiveWidth(65)),
          child: Wrap(
            children: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                .map((e) => Padding(
                      padding: EdgeInsets.all(adaptiveWidth(25)),
                      child: TrendCard(
                        image: "assets/images/s$e.png",
                      ),
                    ))
                .toList(),
          ),
        ),
        verticalSpace(60),
        Padding(
          padding: EdgeInsets.only(left: adaptiveWidth(90)),
          child: Text(
            '#dinner',
            style: AppStyle.categoryBlackTitle,
          ),
        ),
        verticalSpace(30),
        Padding(
            padding: EdgeInsets.only(
                left: adaptiveWidth(65), right: adaptiveWidth(65)),
            child: Wrap(
              children: [10,11,12,13,14,15,16,17,18,19,20,21]
                  .map((e) => Padding(
                        padding: EdgeInsets.all(adaptiveWidth(25)),
                        child: TrendCard(
                          image: "assets/images/s$e.png",
                        ),
                      ))
                  .toList(),
            )),
      ],
    );
  }
}
