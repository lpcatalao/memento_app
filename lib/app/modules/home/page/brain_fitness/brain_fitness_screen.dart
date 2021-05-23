import 'package:memento_app/app/modules/home/page/brain_fitness/brain_fitness_widget.dart';
import 'package:memento_app/app/modules/home/page/model_components/start_list_screen_widget.dart';
import 'package:memento_app/shared/model/item.dart';
import 'package:memento_app/shared/model/task_status.dart';

class BrainFitnessScreen extends ListScreenWidget {
  BrainFitnessScreen()
      : super(
            model: BrainFitnessListWidget(taskStatus: TaskStatus(3, 100)),
            items: [
              Item(text: 'Montar um Quebra Cabeça', state: false),
              Item(text: 'Exercicio mental', state: false),
              Item(text: 'Ler um livro', state: true),
            ]);
}
