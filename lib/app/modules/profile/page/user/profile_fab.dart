import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Colors.black,
      animatedIcon: AnimatedIcons.menu_close,
      curve: Curves.easeInCubic,
      animatedIconTheme: IconThemeData(color: Colors.white),
      overlayColor: Colors.transparent,
      overlayOpacity: 0.0000000001,
      children: [
        SpeedDialChild(
            child: Icon(FontAwesomeIcons.userAlt),
            label: 'Editar Perfil',
            backgroundColor: Colors.white,
            onTap: () => Modular.to.pushNamed('/profile/user/new_user')),
        SpeedDialChild(
            child: Icon(FontAwesomeIcons.userNurse),
            label: 'Editar Cuidador',
            backgroundColor: Colors.white,
            onTap: () => Modular.to.pushNamed('/profile/user/caretaker')),
      ],
    );
  }
}
