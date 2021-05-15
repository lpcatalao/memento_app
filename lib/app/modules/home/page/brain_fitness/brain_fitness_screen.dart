import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/nav_content_layout.dart';
import 'package:memento_app/models/brain_fitness_model.dart';
import 'package:memento_app/models/task_status.dart';

class BrainFitnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xffd5dce6)),
      child: Center(
        child: NavContentLayout(
          model: BrainFitnessCardModel(taskStatus: TaskStatus(8, 10)),
        ),
      ),
    );
  }
}
