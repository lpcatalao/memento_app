import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/home/home_store.dart';
import 'package:memento_app/app/modules/home/page/activity/activity_add_item_screen.dart';
import 'package:memento_app/app/modules/home/page/brain_fitness/brainfitness_add_item_screen.dart';
import 'package:memento_app/app/modules/home/page/medicine/medicine_add_item_screen.dart';
import 'package:memento_app/app/modules/home/page/start_screen.dart';
import 'package:memento_app/app/modules/home/page/submodules/reminder_store.dart';
import 'package:memento_app/app/modules/profile/profile_module.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ReminderStore()),
    Bind.lazySingleton((i) => HomeStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/start', child: (_, __) => StartScreen()),
    ChildRoute('/add_activity', child: (_, __) => ActivityAddItemScreen()),
    ChildRoute('/add_medicine', child: (_, __) => MedicineAddItemScreen()),
    ChildRoute('/add_brain_fitness',
        child: (_, __) => BrainFitnessAddItemScreen()),
    ModuleRoute('/profile', module: ProfileModule()),
  ];
}
