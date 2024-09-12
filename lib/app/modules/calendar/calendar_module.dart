import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/calendar/calendar_Page.dart';

class CalendarModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CalendarPage()),
  ];
}
