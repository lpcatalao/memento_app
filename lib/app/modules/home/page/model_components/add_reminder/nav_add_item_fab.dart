import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/home/page/submodules/reminder_store.dart';
import 'package:memento_app/shared/model/task.dart';

class AddItemFabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _reminder = Modular.get<ReminderStore>();

    return FloatingActionButton.extended(
        backgroundColor: Color(0xff43d836),
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.pop(context);

          final task = Task(_reminder.reminderText, _reminder.dateMillisec,
              _reminder.eventHour, _reminder.eventMin, _reminder.type);

          print(task);
        },
        label: Text('Adicionar'));
  }
}
