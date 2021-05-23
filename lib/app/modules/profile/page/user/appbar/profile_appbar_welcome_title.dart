import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/profile/profile_store.dart';
import 'package:memento_app/shared/model/user_model.dart';

class ProfileAppBarWelcomeTitle extends StatelessWidget {
  final double width;
  final double height;

  ProfileAppBarWelcomeTitle(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    final _profile = Modular.get<ProfileStore>();
    return Container(
        width: width * .8,
        child: Observer(
          builder: (BuildContext context) {
            List<User> users = _profile.users.value;
            if ( users != null) {
              return RichText(
                text: TextSpan(children: [
                  TextSpan(
                      style: const TextStyle(
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          fontStyle: FontStyle.normal,
                          fontSize: 25.0),
                      text: "Olá\n${users[0].name}\n"),
                  TextSpan(
                      style: const TextStyle(
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat",
                          fontStyle: FontStyle.normal,
                          fontSize: 25.0),
                      text: "Este é o seu perfil:")
                ]),
              );
            }

            return Text("");
          },
        ));
  }
}

