import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddUserProfileMid extends StatelessWidget {
  final double width;
  final double height;

  AddUserProfileMid(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * .2,
      decoration: configBoxDecoration(gradientStatus: false),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_buildTitle(), _buildTitleIcon()],
      ),
    );
  }

  Stack _buildTitleIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          child: GestureDetector(
            onTap: () {
              print('Pega Foto');
            },
            child: Container(
              width: height * .12,
              height: height * .12,
              decoration: BoxDecoration(
                  color: Color(0xff15d79e),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
          ),
        ),
        Icon(
          Icons.add_a_photo,
          size: 36,
        ),
      ],
    );
  }

  Container _buildTitle() {
    return Container(
      width: width * .3,
      child: Text("Preencha todos campos para criar o seu perfil:",
          style: const TextStyle(
              color: const Color(0xff1bb789),
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              fontStyle: FontStyle.normal,
              fontSize: 18.0),
          textAlign: TextAlign.left),
    );
  }

  BoxDecoration configBoxDecoration({bool gradientStatus}) {
    return BoxDecoration(borderRadius: borderRadius(true), color: Colors.white);
  }

  BorderRadius borderRadius(bool appBoxBorderStatus) {
    return appBoxBorderStatus == true
        ? BorderRadius.only(bottomLeft: Radius.circular(38))
        : BorderRadius.all(Radius.circular(25));
  }
}
