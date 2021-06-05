import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/calendar/calendar_page.dart';
import 'package:memento_app/app/modules/calendar/calendar_store.dart';
import 'package:memento_app/app/modules/home/home_store.dart';
import 'package:memento_app/app/modules/home/page/activity/activity_add_item_screen.dart';
import 'package:memento_app/app/modules/home/page/brain_fitness/brainfitness_add_item_screen.dart';
import 'package:memento_app/app/modules/home/page/medicine/medicine_add_item_screen.dart';
import 'package:memento_app/app/modules/home/page/start_screen.dart';
import 'package:memento_app/app/modules/profile/profile_module.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(i())),
    Bind.lazySingleton((i) => CalendarStore(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/start', child: (_, __) => StartPage()),
    ChildRoute('/add_activity', child: (_, __) => ActivityAddItemPage()),
    ChildRoute('/add_medicine', child: (_, __) => MedicineAddItemPage()),
    ChildRoute('/add_brain_fitness',
        child: (_, __) => BrainFitnessAddItemPage()),
    ChildRoute('/calendar', child: (_, __) => CalendarPage()),
    ModuleRoute('/profile', module: ProfileModule()),
  ];
}
