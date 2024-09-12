import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/calendar/calendar_appbar_widget.dart';
import 'package:memento_app/app/modules/calendar/calendar_store.dart';
import 'package:memento_app/app/modules/calendar/calendar_task_from_date_card_widget.dart';
import 'package:memento_app/app/modules/calendar/table_calendar_widget.dart';
import 'package:memento_app/constants/general_app_constants.dart';

class CalendarPage extends StatefulWidget {
  final String title;

  const CalendarPage({Key key, this.title = 'CalendarPage'}) : super(key: key);

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends ModularState<CalendarPage, CalendarStore> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: GeneralAppColor.appBackgroundGray,
        child: Column(
          children: [
            CalendarAppbarWidget(_size.width, _size.height),
            SizedBox(
              height: _size.height * .02,
            ),
            TableCalendarWidget(),
            SizedBox(
              height: _size.height * .02,
            ),
            Expanded(
              child: Container(
                width: _size.width * .95,
                child: Observer(
                  builder: (BuildContext context) {
                    final tasks = store.tasks.value;
                    if (tasks != null) {
                      return MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder: (BuildContext context, int index) {
                              final t = tasks[index];
                              store.setModel(t);
                              return TaskFromDateCardWidget(store.model, t);
                            },
                          ));
                    }
                    return Center(
                        child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Text("Loading...")
                      ],
                    ));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
