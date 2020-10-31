import 'package:baseapp/models/bundle_model.dart';

class CategoryModel {
  final String title;
  final String image;
  final List<BundleModel> bundles;
  final String subtitle;

  CategoryModel({this.title, this.image, this.bundles, this.subtitle});
}