import 'package:flutter/material.dart';
import 'package:memento_app/screen/option_base_screen.dart';

class MedicalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.orangeAccent),
      child: Center(
        child: OptionBaseScreen(title: 'Medicamento'),
      ),
    );
  }
}
