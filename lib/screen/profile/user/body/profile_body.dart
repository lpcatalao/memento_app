import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                children: [
                  SizedBox(height: height * .03),
                  buildTitle("Telefone"),
                  buildTitleContent(
                      Icon(Icons.phone), '+351 991 900 000', bigger: false),
                  Spacer(),
                  buildTitle("E-mail"),
                  buildTitleContent(
                      Icon(Icons.mail), 'josealmeida@umemail.com', bigger: true),
                  SizedBox(height: height * .04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitleContent(Icon icon, String text, {bool bigger = false}) {
    var boxWidth = (width * .6);
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: bigger == true ? boxWidth : (width * .44),
        height: 41,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(21)),
            color: const Color(0xffffffff)),
        child: Row(
          children: [
            Container(
              width: boxWidth * .2,
              height: 41,
              child: icon,
              color: Colors.transparent,
            ),
            Container(
              width: bigger == true ? boxWidth * .8 : boxWidth * .5,
              height: 41,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(text,
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
            style: const TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.left),
      ),
    );
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
