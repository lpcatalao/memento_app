import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/blocs/onboarding_bloc.dart';
import 'package:memento_app/screen/onboard/onboarding_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(Memento());
}

class Memento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //suporte para manter o layout responsivo em questao de width e height e também a fontsize
    return MultiProvider(
      providers: [
        Provider<OnboardingBloc>(create: (_) => OnboardingBloc()),
      ],
      child: LayoutBuilder(builder: (context, constraints) {
        ScreenUtil.init(constraints,
            designSize: Size(
              constraints.maxWidth,
              constraints.maxHeight,
            ));

        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Memento App Demo',
            home: OnboardingScreen());
      }),
    );
  }
}
