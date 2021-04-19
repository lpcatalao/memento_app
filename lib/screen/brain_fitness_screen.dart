import 'package:flutter/material.dart';
import 'package:memento_app/screen/option_base_screen.dart';

class BrainFitnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.lightBlue),
      child: Center(
        child: OptionBaseScreen(
          title: 'Brain Fitness',
        ),
      ),
    );
  }
}
