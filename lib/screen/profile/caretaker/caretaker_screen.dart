import 'package:flutter/material.dart';
import 'package:memento_app/screen/profile/caretaker/caretaker_add.dart';
import 'package:memento_app/screen/profile/caretaker/caretaker_list.dart';

import 'caretaker_appbar.dart';

class CaretakerScreen extends StatelessWidget {
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
          CaretakerScreenAppBar(_size.width, _size.height),
          CaretakerList(_size.width, _size.height)
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => AddCaretaker()));
        },
        label: Text("Novo Cuidador"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
