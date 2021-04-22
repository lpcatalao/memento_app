import 'package:flutter/material.dart';
import 'package:memento_app/models/medicine_model.dart';
import 'package:memento_app/models/task_status.dart';
import 'package:memento_app/screen/nav/nav_content_layout.dart';

class MedicineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Color(0xffd5dce6)),
        child: Center(
          child: NavContentLayout(
            model: MedicineCardModel(taskStatus: TaskStatus(2,5)),
          ),
        ));
  }
}
