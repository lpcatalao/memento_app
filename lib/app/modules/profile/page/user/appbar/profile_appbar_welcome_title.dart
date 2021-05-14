import 'package:flutter/material.dart';

class ProfileAppBarWelcomeTitle extends StatelessWidget {
  final double width;
  final double height;

  ProfileAppBarWelcomeTitle(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width * .8,
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat",
                    fontStyle: FontStyle.normal,
                    fontSize: 25.0),
                text: "Olá\nJosé Souza Silva\n"),
            TextSpan(
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Montserrat",
                    fontStyle: FontStyle.normal,
                    fontSize: 25.0),
                text: "Este é o seu perfil:")
          ]),
        ));
  }
}
