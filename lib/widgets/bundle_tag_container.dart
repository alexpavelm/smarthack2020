import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/models/bundle_object_model.dart';
import 'package:flutter/material.dart';

class BundleTagContainer extends StatelessWidget {
  final BundleObjectModel bundleTagModel;

  const BundleTagContainer({Key key, this.bundleTagModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bundleTagModel.color,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: adaptiveWidth(7), horizontal: adaptiveWidth(25)),
        child: Text(bundleTagModel.title.toLowerCase(), style: AppStyle.bundleTag,),
      ),
    );
  }
}
