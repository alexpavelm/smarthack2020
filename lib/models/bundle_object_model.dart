import 'package:flutter/material.dart';

class BundleObjectModel {
  final String title;
  final Color color;
  final String image;
  final String subtitle;
  bool shouldKeep;

  BundleObjectModel({this.title, this.color, this.image, this.subtitle, this.shouldKeep});
}