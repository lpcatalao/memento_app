import 'package:flutter/material.dart';
import 'package:memento_app/models/brain_fitness_model.dart';
import 'package:memento_app/screen/nav/option_base_screen.dart';

class BrainFitnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xffd5dce6)),
      child: Center(
        child: NavOptionBaseScreen(
          model: BrainFitnessCardModel(),
        ),
      ),
    );
  }
}
