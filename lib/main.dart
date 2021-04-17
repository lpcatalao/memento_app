import 'package:flutter/material.dart';
import 'package:memento_app/control/init_screen_control.dart';
import 'package:memento_app/screen/profile_screen.dart';

void main() {
  runApp(Memento());
}

class Memento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memento App Demo',
      home: ProfileScreen(),
    );
  }
}
