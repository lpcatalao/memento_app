import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/profile/page/caretaker/caretaker_add_appbar.dart';
import 'package:memento_app/app/modules/profile/page/caretaker/caretaker_add_form.dart';

class AddCaretaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          AddCaretakerScreenAppBar(_size.width, _size.height),
          AddCaretakerBodyForm(_size.width, _size.height),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text("Adicionar"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
