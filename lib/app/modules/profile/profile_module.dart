import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/profile/page/add_user/add_user_profile.dart';
import 'package:memento_app/app/modules/profile/page/caretaker/caretaker_add.dart';
import 'package:memento_app/app/modules/profile/page/caretaker/caretaker_screen.dart';
import 'package:memento_app/app/modules/profile/page/user/profile_screen.dart';
import 'package:memento_app/app/modules/profile/profile_store.dart';
import 'package:memento_app/database/app_database.dart';
import 'package:memento_app/database/dao/caretaker_dao.dart';
import 'package:memento_app/database/dao/user_dao.dart';
import 'package:memento_app/shared/model/caretaker_store.dart';
import 'package:memento_app/shared/model/user_store.dart';
import 'package:memento_app/shared/repository/profile_repository.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AppDatabase()),
    Bind.lazySingleton((i) => UserStore()),
    Bind.lazySingleton((i) => CaretakerStore()),
    Bind.lazySingleton((i) => ProfileStore(i(), i(), i())),
    Bind.lazySingleton((i) => UserDao(i())),
    Bind.lazySingleton((i) => CaretakerDao(i())),
    Bind.lazySingleton((i) => ProfileRepository(i(), i())),
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
