import 'package:baseapp/misc/colors.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/models/bundle_model.dart';
import 'package:baseapp/models/bundle_object_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TagCard extends StatefulWidget {
  final BundleObjectModel bundleObjectModel;
  final Function onRemove;

  const TagCard({Key key, this.bundleObjectModel, this.onRemove})
      : super(key: key);

  @override
  _TagCardState createState() => _TagCardState();
}

class _TagCardState extends State<TagCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: adaptiveHeight(30)),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Stack(
              children: [
                Container(
                  width: adaptiveWidth(900),
                  height: adaptiveHeight(190),
                  decoration: new BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new AssetImage(widget.bundleObjectModel.image),
                    ),
                  ),
                ),
                Positioned(
                  bottom: adaptiveHeight(40),
                  left: adaptiveWidth(100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.bundleObjectModel.title,
                          style: AppStyle.categoryWhiteTitle),
                      Text(
                        widget.bundleObjectModel.shouldKeep == null || widget.bundleObjectModel.shouldKeep ? widget.bundleObjectModel.subtitle : "You won't receive this next time",
                        style: widget.bundleObjectModel.shouldKeep == null ||
                                widget.bundleObjectModel.shouldKeep
                            ? AppStyle.greenSubtitle
                            : AppStyle.redSubtitle,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: adaptiveWidth(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: IconSlideAction(
                color: AppColor.lightGreen,
                icon: Icons.check,
                onTap: () {
                  setState(() {
                    widget.bundleObjectModel.shouldKeep = true;
                  });
                },
              ),
            ),
          ),
        ],
        secondaryActions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: adaptiveWidth(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Transform.rotate(
                angle: 45 * 3.14 / 180,
                child: IconSlideAction(
                  color: Colors.red,
                  icon: Icons.add,
                  onTap: () {
                    setState(() {
                      widget.bundleObjectModel.shouldKeep = false;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
