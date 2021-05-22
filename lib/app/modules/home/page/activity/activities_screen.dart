import 'package:memento_app/app/modules/home/page/activity/activity_list_widget.dart';
import 'package:memento_app/app/modules/home/page/nav_content_layout.dart';
import 'package:memento_app/shared/model/item.dart';
import 'package:memento_app/shared/model/task_status.dart';

class ActivityScreen extends NavContentLayout {
  ActivityScreen()
      : super(
            model: ActivityListWidget(taskStatus: TaskStatus(3, 100)),
            items: [
              Item(text: 'Andar com José', state: false),
              Item(text: 'Ler um Livro', state: false),
              Item(text: 'Fazer um exercício', state: true),
            ]);
}
