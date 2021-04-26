import 'package:flutter/material.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';

class NavAddItemMid extends StatelessWidget {
  final double width;
  final double height;

  NavAddItemMid(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    final maxHeight = height * .3;
    return Container(
      width: width,
      height: maxHeight,
      decoration: configBoxDecoration(),
      child: Align(
        alignment: Alignment.center,
        child: Stack(children: [
          Container(
            width: width * .8,
            height: maxHeight * .8,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/add_medicine.png'))),
          )
        ]),
      ),
    );
  }

  BoxDecoration configBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(38), bottomRight: Radius.circular(38)));
  }

  BorderRadius borderRadius(bool appBoxBorderStatus) {
    return appBoxBorderStatus == true
        ? BorderRadius.only(bottomLeft: Radius.circular(38))
        : BorderRadius.all(Radius.circular(25));
  }
}
