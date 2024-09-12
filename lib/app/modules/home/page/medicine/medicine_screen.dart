import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:memento_app/app/modules/home/page/medicine/medicine_list.dart';
import 'package:memento_app/app/modules/home/page/model_components/start_item_list_screen_widget.dart';
import 'package:memento_app/app/modules/home/page/model_components/start_list_screen_widget.dart';

class MedicineScreen extends ListScreenWidget {
  MedicineScreen() : super(model: MedicineListWidget());

  @override
  Widget undoneList() {
    reminder.fetchMedicineTask();
    return Observer(
      builder: (BuildContext context) {
        final tasks = reminder.medicinesTasks.value;

        if (tasks != null) {
          return MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final t = tasks[index];
                return ItemListScreenWidget(model, t);
              },
            ),
          );
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
    );
  }

  @override
  Widget doneList() {
    reminder.fetchMedicineTaskDone();
    return Observer(
      builder: (BuildContext context) {
        final tasks = reminder.medicinesTasksDone.value;

        if (tasks != null) {
          return MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final t = tasks[index];
                return ItemListScreenWidget(model, t);
              },
            ),
          );
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
    );
  }
}
