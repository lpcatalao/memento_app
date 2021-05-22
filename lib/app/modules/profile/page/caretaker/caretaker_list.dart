import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memento_app/app/modules/profile/profile_store.dart';
import 'package:memento_app/shared/model/caretaker_model.dart';

class CaretakerList extends StatelessWidget {
  final double width;
  final double height;

  CaretakerList(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    final _profile = Modular.get<ProfileStore>();
    // _profile.caretakers
    final double maxWidth = width * .85;
    return Expanded(
      child: Container(
        width: maxWidth,
        child: Observer(
          builder: (BuildContext context) {
            List<Caretaker> caretakers = _profile.caretakers.value;
            if (caretakers != null) {
              return ListView.builder(
                itemCount: caretakers.length,
                itemBuilder: (BuildContext context, int index) {
                  final caretaker = caretakers[index];
                  return _buildCaretakerTile(
                      context: context, caretaker: caretaker);
                },
              );
            }
            return _buildCaretakerTile();
          },
        ),
      ),
    );
  }

  Card _buildCaretakerTile({BuildContext context, Caretaker caretaker}) {
    return Card(
      child: ListTile(
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.plusCircle,
              color: Colors.teal,
            )),
        leading: Icon(
          FontAwesomeIcons.userNurse,
          color: Colors.black,
        ),
        title: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            textColor: Colors.teal,
            collapsedIconColor: Colors.teal,
            iconColor: Colors.teal,
            title: Text(
              caretaker.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              _buildTextRich(FontAwesomeIcons.phone,
                  TextSpan(text: '  ${caretaker.phone}')),
              SizedBox(
                height: 12,
              ),
              _buildTextRich(FontAwesomeIcons.home,
                  TextSpan(text: '  ${caretaker.address}')),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildTextRich(IconData icon, TextSpan span) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
        children: [
          WidgetSpan(
            child: Icon(
              icon,
              size: 18,
            ),
          ),
          span
        ],
      ),
    );
  }
}
