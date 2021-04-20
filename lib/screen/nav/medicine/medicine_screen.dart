import 'package:flutter/material.dart';
import 'package:memento_app/models/medicine_model.dart';
import 'package:memento_app/screen/nav/option_base_screen.dart';

class MedicalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Color(0xffd5dce6)),
        child: Center(
          child: NavOptionBaseScreen(
            model: MedicineCardModel(),
          ),
        ));
  }
}
