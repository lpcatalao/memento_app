import 'package:flutter/material.dart';

class AddItemFabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: Color(0xff43d836),
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text('Adicionar'));
  }
}
