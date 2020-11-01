import 'package:baseapp/misc/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

abstract class AppStyle {

  static TextStyle categoryWhiteTitle = TextStyle(fontSize: adaptiveFont(60), fontWeight: FontWeight.w900, color: Colors.white);
  static TextStyle categoryBlackTitle = TextStyle(fontSize: adaptiveFont(60), fontWeight: FontWeight.w900, color: Colors.black);
  static TextStyle pageTitle = TextStyle(fontSize: adaptiveFont(75), fontWeight: FontWeight.w900, color: Colors.black);
  static TextStyle categoryWhiteSubtitle = TextStyle(fontSize: adaptiveFont(35), fontWeight: FontWeight.w400, color: Colors.white);
  static TextStyle categoryGreySubtitle = TextStyle(fontSize: adaptiveFont(35), fontWeight: FontWeight.w400, color: Colors.grey);
  static TextStyle greenSubtitle = TextStyle(fontSize: adaptiveFont(35), fontWeight: FontWeight.w500, color: AppColor.lightGreen);
  static TextStyle redSubtitle = TextStyle(fontSize: adaptiveFont(35), fontWeight: FontWeight.w500, color: Colors.red);
  static TextStyle smallBundleTitle= TextStyle(fontSize: adaptiveFont(40), fontWeight: FontWeight.w900, color: Colors.black);
  static TextStyle suggestionTitle = TextStyle(fontSize: adaptiveFont(40), fontWeight: FontWeight.w700, color: Colors.black);
  static TextStyle bigBundleTitle= TextStyle(fontSize: adaptiveFont(75), fontWeight: FontWeight.w900, color: Colors.white);
  static TextStyle bigBundleSubtitle= TextStyle(fontSize: adaptiveFont(35), fontWeight: FontWeight.w400, color: AppColor.lightGreen);
  static TextStyle bundleTag= TextStyle(fontSize: adaptiveFont(33), fontWeight: FontWeight.w700, color: Colors.black);
  static TextStyle bundleTagMore= TextStyle(fontSize: adaptiveFont(33), fontWeight: FontWeight.w700, color: Colors.white);

  static TextStyle loginTitle = TextStyle(fontSize: ScreenUtil().setSp(110), color: AppColor.black);
  static TextStyle whiteTitle = TextStyle(fontSize: ScreenUtil().setSp(110), color: AppColor.white);
  static TextStyle grayText = TextStyle(fontSize: ScreenUtil().setSp(50), color: AppColor.grey);
  static TextStyle graySmallText = TextStyle(fontSize: ScreenUtil().setSp(40), color: AppColor.grey);
  static TextStyle graySmallestText = TextStyle(fontSize: ScreenUtil().setSp(35), color: AppColor.grey);
  static TextStyle whiteText = TextStyle(fontSize: ScreenUtil().setSp(50), color: AppColor.white);
  static TextStyle blackText = TextStyle(fontSize: ScreenUtil().setSp(50), color: AppColor.black);
  static TextStyle blackSmallText = TextStyle(fontSize: ScreenUtil().setSp(40), color: AppColor.black);
  static TextStyle whiteSmallText = TextStyle(fontSize: ScreenUtil().setSp(40), color: AppColor.white);
  static TextStyle blackSmallestText = TextStyle(fontSize: ScreenUtil().setSp(35), color: AppColor.black);
  static TextStyle logoText = TextStyle(fontSize: ScreenUtil().setSp(90), color: AppColor.white, fontWeight: FontWeight.w500);
}