import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/profile/profile_store.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/shared/model/user_model.dart';
import 'package:mobx/mobx.dart';

class DashboardAppBarWelcomeTitle extends StatelessWidget {
  final double width;
  final _profile = Modular.get<ProfileStore>();

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
              child: Observer(
                builder: (BuildContext context) {
                  if (_profile.users.status == FutureStatus.fulfilled) {
                    List<User> users = _profile.users.value;
                    if (users.length == 0) {
                      return _buildTitle("Utilizador");
                    } else {
                      return _buildTitle(users[0].name);
                    }
                  }
                  return _buildTitle("Utilizador");
                },
              ),
            )));
  }

  RichText _buildTitle(String name) {
    return RichText(
        text: TextSpan(children: [
      _buildNameTitle(name),
      _buildSubTitle(),
    ]));
  }

  TextSpan _buildSubTitle() {
    return TextSpan(
        style: configTitleFont(FontWeight.w400), text: "Afazeres do dia: ");
  }

  TextSpan _buildNameTitle(String name) {
    return TextSpan(
        style: configTitleFont(FontWeight.w700), text: "Olá ${name}, \n");
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
