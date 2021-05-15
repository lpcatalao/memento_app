import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_profile.dart';
import 'package:memento_app/app/modules/profile/page/caretaker/caretaker_add.dart';
import 'package:memento_app/app/modules/profile/page/caretaker/caretaker_screen.dart';
import 'package:memento_app/app/modules/profile/page/user/profile_screen.dart';
import 'package:memento_app/app/modules/profile/profile_store.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProfileStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/user', child: (_, args) => ProfileScreen()),
    ChildRoute('/user/caretaker', child: (_, args) => CaretakerScreen()),
    ChildRoute('/user/new_user', child: (_, args) => AddUserProfile()),
    ChildRoute('/user/caretaker/new_caretaker',
        child: (_, args) => AddCaretaker())
  ];
}
