import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';
import 'package:memento_app/constants%20/memento_icons.dart';

class NavAddItemTop extends StatelessWidget {
  final double width;
  final double height;

  NavAddItemTop(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * .2,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            GeneralAppColor.customAppBar1,
            GeneralAppColor.customAppBar2
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: width * .4,
            child: Text("NOVO\nMEDICAMENTO",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.left),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: height * 0.07,
                height: height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    color: const Color(0xffd5ffe0)),
              ),
              Icon(MementoIcons.iconmapdoctor)
            ],
          )
        ],
      ),
    );
  }
}
