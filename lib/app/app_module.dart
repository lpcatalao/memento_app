import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/home/home_module.dart';

class AppModule extends Module {

  @override
  final List<Bind> binds = [];

  @override
  final List<ModuleRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule())
  ];
}
