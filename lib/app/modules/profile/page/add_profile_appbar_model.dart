import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memento_app/constants/general_app_constants.dart';

abstract class ProfileAppbarModel extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final IconData icon;
  final Color bgColor;

  ProfileAppbarModel(
      this.width, this.height, this.title, this.icon, this.bgColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * .2,
      color: bgColor,
      child: Container(
        decoration: configBoxDecoration(gradientStatus: true),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_buildTitle(), _buildTitleIcon()],
        ),
      ),
    );
  }

  Stack _buildTitleIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0.2,
          child: Container(
            width: height * .07,
            height: height * .07,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
        Icon(
          icon,
          color: Colors.white,
        )
      ],
    );
  }

  Container _buildTitle() {
    return Container(
      child: Text(title,
          style: const TextStyle(
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins",
              fontStyle: FontStyle.normal,
              fontSize: 20.0),
          textAlign: TextAlign.left),
    );
  }

  BoxDecoration configBoxDecoration({bool gradientStatus}) {
    return BoxDecoration(
        borderRadius: borderRadius(true),
        gradient: LinearGradient(
            begin: Alignment(1, 0),
            end: Alignment(0, 0.5938237309455872),
            colors: [
              GeneralAppColor.customAppBar1,
              GeneralAppColor.customAppBar2
            ]));
  }

  BorderRadius borderRadius(bool appBoxBorderStatus) {
    return appBoxBorderStatus == true
        ? BorderRadius.only(bottomLeft: Radius.circular(38))
        : BorderRadius.all(Radius.circular(25));
  }
}
