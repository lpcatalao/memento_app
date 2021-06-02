import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/map/map_Page.dart';
import 'package:memento_app/app/modules/map/map_store.dart';

class MapModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MapStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MapPage()),
  ];
}
