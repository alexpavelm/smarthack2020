import 'package:baseapp/misc/utils.dart';
import 'package:baseapp/models/category_model.dart';
import 'package:flutter/material.dart';

class FourthScreen extends StatefulWidget {
  final CategoryModel categoryModel;

  const FourthScreen({Key key, this.categoryModel}) : super(key: key);
  @override
  _FourthScreenState createState() => _FourthScreenState(categoryModel);
}

class _FourthScreenState extends State<FourthScreen> {
  final CategoryModel categoryModel;

  _FourthScreenState(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Image.asset(
              categoryModel.image,
            ),
            Positioned(
              child: Container(
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.white, Colors.transparent],
                    stops: [0.7, 1],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
