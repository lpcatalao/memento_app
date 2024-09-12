import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/model_components/alert/alert_model.dart';

class MapAlertDialog extends AlertDialogWidget {
  static const String _TITLE = "Marcação de Perímetro";
  static const String _DESCRIPTION =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  static const String _IMAGE = 'images/map.png';

  MapAlertDialog()
      : super(_TITLE, _DESCRIPTION, _IMAGE, () {
          return ElevatedButton.styleFrom(
            primary: Colors.teal,
            onPrimary: Colors.white,
            onSurface: Colors.grey,
          );
        }, AlertType.MAP);
}
