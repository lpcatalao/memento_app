import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/home/page/submodules/reminder_store.dart';
import 'package:memento_app/app/modules/onboarding/onboarding_module.dart';
import 'package:memento_app/app/modules/onboarding/onboarding_store.dart';
import 'package:memento_app/app/modules/profile/profile_store.dart';
import 'package:memento_app/database/app_database.dart';
import 'package:memento_app/database/dao/caretaker_dao.dart';
import 'package:memento_app/database/dao/task_dao.dart';
import 'package:memento_app/database/dao/user_dao.dart';
import 'package:memento_app/shared/model/caretaker_store.dart';
import 'package:memento_app/shared/model/user_store.dart';
import 'package:memento_app/shared/notification/local_notification.dart';
import 'package:memento_app/shared/repository/onboard_repository.dart';
import 'package:memento_app/shared/repository/profile_repository.dart';
import 'package:memento_app/shared/repository/task_repository.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => OnboardinRepository()),
    Bind.singleton((i) => AppDatabase()),
    Bind.singleton((i) => UserStore()),
    Bind.singleton((i) => CaretakerStore()),
    Bind.singleton((i) => ProfileStore(i(), i(), i())),
    Bind.lazySingleton((i) => UserDao(i())),
    Bind.lazySingleton((i) => CaretakerDao(i())),
    Bind.lazySingleton((i) => ProfileRepository(i(), i())),
    Bind.lazySingleton((i) => TaskDao(i())),
    Bind.lazySingleton((i) => TaskRepository(i())),
    Bind.lazySingleton((i) => ReminderStore(i(), i())),
    Bind.lazySingleton((i) => OnboardingStore(i())),
    Bind.lazySingleton((i) => LocalNofifyManager())
  ];

  @override
  final List<ModuleRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: OnboardingModule()),
  ];
}
