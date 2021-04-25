import 'package:flutter/material.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';

class ProfileBottom extends StatelessWidget {
  final double width;
  final double height;

  ProfileBottom(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * .15,
      decoration: configBoxDecoration(color: GeneralAppColor.bottomProfileColor2),
    );
  }

  BoxDecoration configBoxDecoration({Color color}) {
    return BoxDecoration(color: color);
  }

}
