import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CaretakerList extends StatelessWidget {
  final double width;
  final double height;

  CaretakerList(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    final double maxWidth = width * .85;
    return Expanded(
      child: Container(
        width: maxWidth,
        child: ListView(
          children: [
            _buildCaretakerTile("Cuidador 1"),
            _buildCaretakerTile("Cuidador 2"),
            _buildCaretakerTile("Cuidador 3"),
          ],
        ),
      ),
    );
  }

  Widget _buildCaretakerTile(String name) {
    return Card(
      child: ListTile(
        leading: Icon(FontAwesomeIcons.userNurse),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
