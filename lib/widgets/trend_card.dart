import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';

class TrendCard extends StatelessWidget {
  final String image;

  const TrendCard({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
          width: adaptiveWidth(260),
          height: adaptiveWidth(260),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          )),
    );
  }
}
