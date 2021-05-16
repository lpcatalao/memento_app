import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/profile/page/caretaker/caretaker_add_appbar.dart';
import 'package:memento_app/app/modules/profile/page/caretaker/caretaker_add_form.dart';
import 'package:memento_app/app/modules/profile/profile_store.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/shared/model/caretaker_model.dart';

class AddCaretaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _profile = Modular.get<ProfileStore>();
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
            AddCaretakerScreenAppBar(_size.width, _size.height),
            AddCaretakerBodyForm(_size.width, _size.height),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final name = _profile.caretaker.name;
          final address = _profile.caretaker.address;
          final city = _profile.caretaker.city;
          final phone = _profile.caretaker.phone;

          final caretaker = Caretaker(name, address, city, phone);
          _profile.insertCaretaker(caretaker);
          _profile.fetchCaretakers();

          Navigator.pop(context);
        },
        label: Text("Adicionar"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
