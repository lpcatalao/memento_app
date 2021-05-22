import 'package:flutter/material.dart';

class AddItemImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final String image;

  AddItemImageWidget(this.width, this.height, this.image);

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
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
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
