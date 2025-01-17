import 'package:flutter/material.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';

class DashboardAppBarWelcomeTitle extends StatelessWidget {
  final double width;

  DashboardAppBarWelcomeTitle(this.width);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        color: Colors.transparent,
        width: width * .7,
        child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: configTitleFont(FontWeight.w700),
                  text: "Olá José, \n"),
              TextSpan(
                  style: configTitleFont(FontWeight.w400),
                  text: "Afazeres do dia: ")
            ]))),
      ),
    );
  }

  TextStyle configTitleFont(FontWeight fontWeight) {
    return TextStyle(
        color: GeneralAppColor.softBlack,
        fontWeight: fontWeight,
        fontFamily: "Montserrat",
        fontStyle: FontStyle.normal,
        fontSize: 25.0);
  }
}
