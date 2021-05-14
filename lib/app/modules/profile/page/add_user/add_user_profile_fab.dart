import 'package:flutter/material.dart';

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
