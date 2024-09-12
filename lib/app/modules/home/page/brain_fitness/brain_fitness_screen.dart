import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:memento_app/app/modules/home/page/brain_fitness/brain_fitness_widget.dart';
import 'package:memento_app/app/modules/home/page/model_components/start_item_list_screen_widget.dart';
import 'package:memento_app/app/modules/home/page/model_components/start_list_screen_widget.dart';

class BrainFitnessScreen extends ListScreenWidget {
  BrainFitnessScreen() : super(model: BrainFitnessListWidget());

  @override
  Widget undoneList() {
    reminder.fetchBrainFitnessTask();

    return Observer(
      builder: (BuildContext context) {
        final tasks = reminder.brainFitnessTasks.value;

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
    reminder.fetchBrainFitnessTaskDone();

    return Observer(
      builder: (BuildContext context) {
        final tasks = reminder.brainFitnessTasksDone.value;

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
