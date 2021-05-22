import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddItemAppBarWidget extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Color appBarColor;
  final IconData icon;

  AddItemAppBarWidget(
      this.width, this.height, this.title, this.appBarColor, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * .2,
      decoration: BoxDecoration(
        color: appBarColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: width * .4,
            child: Text(title,
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
              Opacity(
                opacity: 0.5,
                child: Container(
                  width: height * 0.07,
                  height: height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      color: const Color(0xffd5ffe0)),
                ),
              ),
              Icon(icon)
            ],
          )
        ],
      ),
    );
  }
}
