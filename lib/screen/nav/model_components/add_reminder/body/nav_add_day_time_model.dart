import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class NavAddDayTimeModel extends StatelessWidget {
  String _text;
  IconData _icon;

  NavAddDayTimeModel(this._text, this._icon);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: _buildIcon(),
        title: _buildTitle(),
        trailing: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xff43d836),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            Icon(
              FontAwesomeIcons.edit,
              color: Colors.black,
              size: 16,
            )
          ],
        ),
      ),
    ));
  }

  Text _buildTitle() {
    return Text(_text,
        style: const TextStyle(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w700,
            fontFamily: "Poppins",
            fontStyle: FontStyle.normal,
            fontSize: 16.0),
        textAlign: TextAlign.left);
  }

  Icon _buildIcon() {
    return Icon(
      _icon,
      color: Colors.black,
    );
  }
}
