import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';

class ProfileBody extends StatelessWidget {
  final double width;
  final double height;

  ProfileBody(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: configBoxDecoration(gradientStatus: true),
        width: width,
        child: Padding(
          padding: const EdgeInsets.only(left: 36.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildTitle("Telefone"),
                  buildTitleContent(Icon(Icons.phone), 'Text'),
                  buildTitle("E-mail"),
                  buildTitleContent(Icon(Icons.mail), 'josealmeida@umemail.com')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildTitleContent(Icon icon, String text) {
    return Container(
      width: 185,
      height: 41,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(21)),
          color: const Color(0xffffffff)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon,
          Text(text,
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0),
              textAlign: TextAlign.left)
        ],
      ),
    );
  }

  Text buildTitle(String title) {
    return Text(title,
        style: const TextStyle(
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w700,
            fontFamily: "Poppins",
            fontStyle: FontStyle.normal,
            fontSize: 10.0),
        textAlign: TextAlign.left);
  }

  BoxDecoration configBoxDecoration({bool gradientStatus}) {
    return BoxDecoration(
        borderRadius: borderRadius(true),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              GeneralAppColor.bottomProfileColor2,
              GeneralAppColor.bottomProfileColor1
            ]));
  }

  BorderRadius borderRadius(bool appBoxBorderStatus) {
    return appBoxBorderStatus == true
        ? BorderRadius.only(bottomLeft: Radius.circular(38))
        : BorderRadius.all(Radius.circular(25));
  }
}
