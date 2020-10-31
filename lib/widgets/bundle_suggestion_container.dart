import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';

class BundleSuggestionContainer extends StatelessWidget {
  final String title;

  const BundleSuggestionContainer({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: adaptiveWidth(35), bottom: adaptiveWidth(25)),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffe3e3e3),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: adaptiveWidth(15), horizontal: adaptiveWidth(35)),
          child: Text(title, style: AppStyle.suggestionTitle,),
        ),
      ),
    );
  }
}
