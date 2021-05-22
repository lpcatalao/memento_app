import 'package:memento_app/app/modules/home/page/medicine/medicine_list.dart';
import 'package:memento_app/app/modules/home/page/nav_content_layout.dart';
import 'package:memento_app/shared/model/item.dart';
import 'package:memento_app/shared/model/task_status.dart';

class MedicineScreen extends NavContentLayout {
  MedicineScreen()
      : super(
            model: MedicineListWidget(taskStatus: TaskStatus(3, 100)),
            items: [
              Item(text: 'Toma Remédio 1', state: false),
              Item(text: 'Remédio 2', state: false),
              Item(text: '3', state: true),
            ]);
}
