import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/home/page/nav_controller.dart';
import 'package:memento_app/app/modules/profile/profile_module.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => Home()),
    ModuleRoute('/profile', module: ProfileModule())
  ];
}
