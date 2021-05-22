import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_add_item_list_model.dart';
import 'package:memento_app/constants/memento_icons.dart';

class MedicineAddItemScreen extends AddItemModel {
  MedicineAddItemScreen()
      : super("NOVA\nMEDICAMENTO", "images/add_medicine.png",
            MementoIcons.iconmapdoctor, Colors.teal);
}
