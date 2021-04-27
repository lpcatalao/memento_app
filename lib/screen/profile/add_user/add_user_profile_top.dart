import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memento_app/constants/general_app_constants.dart';

class AddUserProfileTop extends StatelessWidget {
  final double width;
  final double height;

  AddUserProfileTop(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * .2,
      color: Colors.white,
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
          FontAwesomeIcons.user,
          color: Colors.white,
        )
      ],
    );
  }

  Container _buildTitle() {
    return Container(
      child: Text("NOVO\nUTILIZADOR",
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
