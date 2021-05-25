import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/home/page/dashboard/appbar/dashboard_appbar.dart';
import 'package:memento_app/app/modules/home/page/dashboard/body/dashboard_body.dart';
import 'package:memento_app/app/modules/profile/profile_store.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/shared/model/user_model.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = User("Utilizador", "Insira seu endereço", "Insira Sua Cidade",
        0000000000, "");
    user.id = 1;

    final _profile = Modular.get<ProfileStore>();
    _profile.insertUser(user);
    _profile.updateUserCaretaker(1);

    final _size = MediaQuery.of(context).size;

    return Container(
      color: GeneralAppColor.appBackgroundGray,
      width: _size.width,
      height: _size.height,
      child: LayoutBuilder(builder: (context, constraints) {
        final width = _size.width;
        final height = _size.height;
        double percentage = 0;

        if (height < 700) {
          percentage = .45;
        } else {
          percentage = .5;
        }

        final fortyPercentHight = height * .5; //50% height of the screen
        final sixtyPercentHight =
            height * percentage; //50% height of the screen for the body

        return Column(
          children: [
            DashboardAppBar(width: width, height: fortyPercentHight),
            DashboardBodyWidget(
              width: width,
              height: sixtyPercentHight,
            )
          ],
        );
      }),
    );
  }
}
