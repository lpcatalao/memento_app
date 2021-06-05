import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/home/home_module.dart';
import 'package:memento_app/app/modules/onboarding/page/onboarding_page.dart';

class OnboardingModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/onboarding', child: (_, args) => OnboardingPage()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
