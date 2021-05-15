import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/profile/profile_store.dart';
import 'package:memento_app/database/app_database.dart';
import 'package:memento_app/model/user_model.dart';

class AddUserProfileFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _profile = Modular.get<ProfileStore>();
    return FloatingActionButton.extended(
      onPressed: () {
        // Navigator.pop(context);
        final name = _profile.user.name;
        final address = _profile.user.address;
        final city = _profile.user.city;
        final phone = _profile.user.phone;
        final birthDate = _profile.user.birthDate;

        final user = User(name, address, city, phone, birthDate);
        user.id = 1;

        final db = AppDatabase();
        db.insert(user).then((value) {
          db.findAll().then((value) => print(value));
        });

      },
      label: Text('Adicionar'),
      icon: Icon(Icons.add),
      backgroundColor: Colors.teal,
    );
  }
}
