import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/home/home_store.dart';
import 'package:memento_app/app/modules/home/page/activity/activity_add_item_screen.dart';
import 'package:memento_app/app/modules/home/page/brain_fitness/brainfitness_add_item_screen.dart';
import 'package:memento_app/app/modules/home/page/medicine/medicine_add_item_screen.dart';
import 'package:memento_app/app/modules/home/page/nav_controller.dart';
import 'package:memento_app/app/modules/profile/profile_module.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [Bind.singleton((i) => HomeStore())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/start', child: (_, args) => Home()),
    ChildRoute('/add_activity', child: (_, args) => ActivityAddItemScreen()),
    ChildRoute('/add_medicine', child: (_, args) => MedicineAddItemScreen()),
    ChildRoute('/add_brain_fitness',
        child: (_, args) => BrainFitnessAddItemScreen()),
    ModuleRoute('/profile', module: ProfileModule())
  ];
}
