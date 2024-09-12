import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memento_app/app/modules/home/page/submodules/reminder_store.dart';

enum ReminderType { DATE, HOUR }

abstract class AddDayTimeModel extends StatelessWidget {
  final String _text;
  final IconData _icon;
  final ReminderType type;
  final _reminder = Modular.get<ReminderStore>();

  AddDayTimeModel(this._text, this._icon, this.type);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickTimeDay(context).then((date) {
          _reminder.setTime(date);
        });
      },
      child: Container(
          child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: _buildIcon(),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_text,
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 13),
                  textAlign: TextAlign.left),
              Observer(
                builder: (BuildContext context) {
                  return type == ReminderType.HOUR
                      ? schedule(_reminder.hour)
                      : schedule(_reminder.date);
                },
              )
            ],
          ),
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
      )),
    );
  }

  Text schedule(String schedule) {
    return Text(schedule,
        style: const TextStyle(
            color: const Color(0xFF848484),
            fontWeight: FontWeight.w700,
            fontFamily: "Poppins",
            fontStyle: FontStyle.normal,
            fontSize: 13),
        textAlign: TextAlign.left);
  }

  Icon _buildIcon() {
    return Icon(
      _icon,
      color: Colors.black,
    );
  }

  Future<dynamic> pickTimeDay(BuildContext context);
}
