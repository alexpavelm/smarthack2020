import 'package:baseapp/misc/colors.dart';
import 'package:baseapp/misc/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
Widget horizontalSpace(int width) {
  return SizedBox(
    width: ScreenUtil().setWidth(width),
  );
}

Widget verticalSpace(int height) {
  return SizedBox(
    height: ScreenUtil().setHeight(height),
  );
}

num adaptiveHeight(int height) {
  return ScreenUtil().setHeight(height);
}

num adaptiveWidth(int width) {
  return ScreenUtil().setWidth(width);
}

num adaptiveFont(int size) {
  return ScreenUtil().setSp(size);
}

Widget roundedContainer({double width, double height, Widget child, double radius, Color color}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius))),
    child: child,
  );
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget iconButton({String url, IconData icon, String label, Color color}) {
  return GestureDetector(
    onTap: () {
      launchURL(url);
    },
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: adaptiveWidth(15)),
          child: Icon(icon, size: adaptiveWidth(100), color: color,),
        ),
        verticalSpace(10),

        Text(label, style: TextStyle(fontWeight: FontWeight.w300),),
      ],
    ),
  );
}

String getMonth(int month) {
  switch (month) {
    case 1: return "Ianuarie";
    case 2: return "Februarie";
    case 3: return "Martie";
    case 4: return "Aprilie";
    case 5: return "Mai";
    case 6: return "Iunie";
    case 7: return "Iulie";
    case 8: return "August";
    case 9: return "Septembrie";
    case 10: return "Octombrie";
    case 11: return "Noiembrie";
    case 12: return "Decembrie";
    default: return "Unknown date";
  }
}

Widget mainButton({String text, Function onTap, IconData icon, int width}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: adaptiveHeight(125),
      width: adaptiveWidth(width),
      decoration: new BoxDecoration(
          color: AppColor.primary,
          borderRadius: new BorderRadius.all(
            Radius.circular(7.0),
          )),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? Row(
              children: [
                Icon(icon, color: AppColor.white, size: adaptiveWidth(40),),
                horizontalSpace(50),
              ],
            ) : SizedBox.shrink(),
            Text(
              text,
              style: AppStyle.whiteText,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget searchButton({String text, Function onTap, IconData icon}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: adaptiveHeight(125),
      decoration: new BoxDecoration(
          color: AppColor.white,
          borderRadius: new BorderRadius.all(
            Radius.circular(7.0),
          )),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            horizontalSpace(30),
            icon != null ? Row(
              children: [
                Icon(icon, color: AppColor.grey, size: adaptiveWidth(40),),
                horizontalSpace(30),
              ],
            ) : SizedBox.shrink(),
            Text(
              text,
              style: AppStyle.grayText,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget emailField({TextEditingController controller, String label}) {
  return Container(
    height: adaptiveHeight(150),
    child: TextFormField(
      controller: controller,
      style: TextStyle(
        fontSize: adaptiveFont(50),
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(height: 0.5),
      ),
      keyboardType: TextInputType.emailAddress,
    ),
  );
}

Widget nameField({TextEditingController controller, String label}) {
  return Container(
    height: adaptiveHeight(150),
    child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontSize: adaptiveFont(50),
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(height: 0.5),
        ),
        keyboardType: TextInputType.text),
  );
}
