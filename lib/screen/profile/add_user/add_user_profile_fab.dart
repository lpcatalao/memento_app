import 'package:flutter/material.dart';
import 'package:memento_app/screen/profile/add_user/add_user_profile.dart';

class AddUserProfileFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.pop(context);
      },
      label: Text('Adicionar'),
      icon: Icon(Icons.add),
      backgroundColor: Colors.teal,
    );
  }
}
