import 'package:memento_app/app/modules/home/page/brain_fitness/brain_fitness_widget.dart';
import 'package:memento_app/app/modules/home/page/nav_content_layout.dart';
import 'package:memento_app/shared/model/item.dart';
import 'package:memento_app/shared/model/task_status.dart';

class BrainFitnessScreen extends NavContentLayout {
  BrainFitnessScreen()
      : super(
            model: BrainFitnessListWidget(taskStatus: TaskStatus(3, 100)),
            items: [
              Item(text: 'Montar um Quebra Cabeça', state: false),
              Item(text: 'Exercicio mental', state: false),
              Item(text: 'Ler um livro', state: true),
            ]);
}
