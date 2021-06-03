import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/profile/profile_store.dart';
import 'package:memento_app/shared/model/user_model.dart';
import 'package:mobx/mobx.dart';

class ProfileAppBarWelcomeTitle extends StatelessWidget {
  final double width;
  final double height;

  final _profile = Modular.get<ProfileStore>();

  ProfileAppBarWelcomeTitle(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width * .8,
        child: Observer(
          builder: (BuildContext context) {
            if (_profile.users.status == FutureStatus.fulfilled) {
              List<User> users = _profile.users.value;
              if (users.length == 0) {
                return _buildRichText("Utilizador");
              } else {
                return _buildRichText(users[0].name);
              }
            }

            return _buildRichText("Utilizador");
          },
        ));
  }

  RichText _buildRichText(String name) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          style: const TextStyle(
              color: const Color(0xff000000),
              fontWeight: FontWeight.w700,
              fontFamily: "Montserrat",
              fontStyle: FontStyle.normal,
              fontSize: 25.0),
          text: "Olá\n${name}\n"),
      TextSpan(
          style: const TextStyle(
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w400,
              fontFamily: "Montserrat",
              fontStyle: FontStyle.normal,
              fontSize: 25.0),
          text: "Este é o seu perfil:")
    ]));
  }
}
