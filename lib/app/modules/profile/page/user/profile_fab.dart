import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.black,
      onPressed: () {
        Modular.to.pushNamed('/profile/user/new_user');
      },
      label: Text('Editar'),
      icon: Icon(FontAwesomeIcons.edit),
    );
  }
}
