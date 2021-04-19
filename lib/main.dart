import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/screen/nav_controller.dart';

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
        home: Nav(),
      );
    });
  }
}
