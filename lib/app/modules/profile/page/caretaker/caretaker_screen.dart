import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/profile/page/caretaker/caretaker_list.dart';
import 'package:memento_app/constants/general_app_constants.dart';

import 'caretaker_appbar.dart';

class CaretakerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: GeneralAppColor.appBackgroundGray,
        child: Column(
          children: [
            CaretakerScreenAppBar(_size.width, _size.height),
            CaretakerList(_size.width, _size.height)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Modular.to.pushNamed('/home/profile/user/caretaker/new_caretaker');
        },
        label: Text("Novo Cuidador"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
