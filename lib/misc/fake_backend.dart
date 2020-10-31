import 'package:baseapp/models/bundle_model.dart';
import 'package:baseapp/models/bundle_object_model.dart';
import 'package:flutter/material.dart';

List<BundleModel> fruitBundle = [
  BundleModel(
    title: "Fruit Pack",
    subtitle: "Ships next in 3 days",
    price: "9.99",
    image: "assets/images/fruitbundle.png",
    objects: [
      BundleObjectModel(
        title: "Oranges",
        color: Colors.orange.shade100,
        image: "assets/images/fruitbundle.png",
        subtitle: "50% had this",
      ),
      BundleObjectModel(
        title: "Pears",
        color: Colors.orangeAccent.shade100,
        image: "assets/images/fruitbundle.png",
        subtitle: "50% had this",
      ),
      BundleObjectModel(
        title: "Apples",
        color: Colors.red.shade100,
        image: "assets/images/fruitbundle.png",
        subtitle: "50% had this",
      ),
      BundleObjectModel(
        title: "Bananas",
        color: Colors.yellow.shade100,
        image: "assets/images/fruitbundle.png",
        subtitle: "50% had this",
      ),
      BundleObjectModel(
        title: "Grapes",
        color: Colors.yellow.shade100,
        image: "assets/images/fruitbundle.png",
        subtitle: "50% had this",
      )
    ],
  )
];
