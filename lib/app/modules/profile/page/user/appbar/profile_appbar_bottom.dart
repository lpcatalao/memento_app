import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAppBarBottom extends StatelessWidget {
  final double width;
  final double height;

  ProfileAppBarBottom(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    final bottomHeight = height * .12;
    return Container(
      width: width * .8,
      height: bottomHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildAge(bottomHeight),
          Column(
            children: [
              buildBottomTitle('Cidade/Morada'),
              Container(
                width: 180,
                child: Text("Rua ABC, n22, Bairro ABC \nVila Real Portugal",
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildBottomTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Text(title,
            style: const TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.left),
      ),
    );
  }

  Column buildAge(double bottomHeight) {
    return Column(
      children: [buildBottomTitle('Idade'), buildTitleContent(bottomHeight)],
    );
  }

  Container buildTitleContent(double bottomHeight) {
    return Container(
      width: 100,
      height: bottomHeight * .6,
      child: Center(
          child: Text(
        '65 Anos',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      )),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(21)),
          color: const Color(0xffffffff)),
    );
  }
}
