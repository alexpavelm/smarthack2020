import 'package:baseapp/models/bundle_object_model.dart';

class BundleModel {
  final String title;
  final String subtitle;
  final String price;
  final String image;
  final List<BundleObjectModel> objects;

  BundleModel({this.title, this.subtitle, this.image, this.objects, this.price});

}