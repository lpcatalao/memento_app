import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/screen/nav_controller.dart';
import 'package:memento_app/screen/onboard/onboarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Memento());
}

class Memento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //suporte para manter o layout responsivo em questao de width e height e também a fontsize
    return LayoutBuilder(builder: (context, constraints) {
      ScreenUtil.init(
        constraints,
        designSize: Size(constraints.maxWidth, constraints.maxHeight),
      );
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Memento App Demo',
        home: OnboardingScreen(),
      );
    });
  }
}

// // Rectangle 1499
// Container(
// width: 201.396484375,
// height: 7.9935302734375,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.all(
// Radius.circular(18)
// ),
// gradient: LinearGradient(
// begin: Alignment(0, 0.5),
// end: Alignment(1, 0.5),
// colors: [const Color(0xffffba00), const Color(0xffffd93b)])
// )
// )
