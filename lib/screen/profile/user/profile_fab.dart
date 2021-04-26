import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memento_app/screen/profile/add_user/add_user_profile.dart';

class ProfileFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.black,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => AddUserProfile()));
      },
      label: Text('Editar'),
      icon: Icon(FontAwesomeIcons.edit),
    );
  }
}
