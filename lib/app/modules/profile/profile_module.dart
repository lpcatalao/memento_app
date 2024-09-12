import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/map/map_page.dart';
import 'package:memento_app/app/modules/map/map_store.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_profile.dart';
import 'package:memento_app/app/modules/profile/page/caretaker/caretaker_add.dart';
import 'package:memento_app/app/modules/profile/page/caretaker/caretaker_screen.dart';
import 'package:memento_app/app/modules/profile/page/user/profile_screen.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => MapStore())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/user', child: (_, args) => ProfilePage()),
    ChildRoute('/user/caretaker', child: (_, args) => CaretakerPage()),
    ChildRoute('/user/new_user', child: (_, args) => AddUserProfilePage()),
    ChildRoute('/user/caretaker/new_caretaker',
        child: (_, args) => AddCaretakerPage()),
    ChildRoute('/user/map', child: (_, args) => MapPage())
  ];
}
