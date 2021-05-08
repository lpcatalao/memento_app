import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memento_app/blocs/time_bloc.dart';
import 'package:memento_app/utilities/datetime_formatter.dart';

abstract class NavAddDayTimeModel extends StatelessWidget {
  String _text;
  IconData _icon;

  NavAddDayTimeModel(this._text, this._icon);

  @override
  Widget build(BuildContext context) {
    TimeDateBloc _timeDateBloc = TimeDateBloc();



    return GestureDetector(
      onTap: () {
        pickTime(context).then((date) {
          _timeDateBloc.eventSink.add(date);
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
          title: _buildTitle(_timeDateBloc),
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

  Widget _buildTitle(TimeDateBloc timeDateBloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(_text,
            style: const TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.left),
        StreamBuilder<String>(
            stream: timeDateBloc.stateStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return schedule(formatDate(DateTime.now()));
              }

              return schedule(snapshot.data);
            }),
      ],
    );
  }

  Text schedule(String schedule) {
    return Text(schedule,
        style: const TextStyle(
            color: const Color(0xFF848484),
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

  Future<DateTime> pickTime(BuildContext context);
}
