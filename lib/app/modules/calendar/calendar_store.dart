import 'package:memento_app/app/modules/home/page/activity/activity_list_widget.dart';
import 'package:memento_app/app/modules/home/page/brain_fitness/brain_fitness_widget.dart';
import 'package:memento_app/app/modules/home/page/medicine/medicine_list.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_option_card_base.dart';
import 'package:memento_app/shared/model/task.dart';
import 'package:memento_app/shared/repository/task_repository.dart';
import 'package:memento_app/utilities/datetime_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_store.g.dart';

class CalendarStore = _CalendarStoreBase with _$CalendarStore;

abstract class _CalendarStoreBase with Store {
  TaskRepository _taskRepository;

  _CalendarStoreBase(this._taskRepository);

  @observable
  CalendarFormat calendarFormat = CalendarFormat.month;

  @observable
  DateTime focusedDay = DateTime.now();

  @observable
  DateTime selectedDay;

  @observable
  ObservableFuture<List<Task>> tasks = ObservableFuture.value([]);

  @observable
  ListScreenModel model;

  @action
  void setCalendarFormat(CalendarFormat newCalendarFormat) {
    this.calendarFormat = newCalendarFormat;
  }

  @action
  void setFocusedDay(DateTime focusedDay) {
    this.focusedDay = focusedDay;
  }

  @action
  void setSelectedDay(DateTime selectedDay) {
    this.selectedDay = selectedDay;
  }

  @action
  void setModel(Task task) {
    if (task.type == 'Atividade') {
      model = ActivityListWidget();
    } else if (task.type == 'Medicamento') {
      model = MedicineListWidget();
    } else if (task.type == 'BrainFitness') {
      model = BrainFitnessListWidget();
    }
  }

  void isNotSameDay(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(this.selectedDay, selectedDay)) {
      setSelectedDay(selectedDay);
      setFocusedDay(focusedDay);
      fetchTaskFromDate(selectedDay);
    }
  }

  void isDifferentFormat(CalendarFormat format) {
    if (this.calendarFormat != format) {
      setCalendarFormat(format);
    }
  }

  @action
  void fetchTaskFromDate(DateTime dateTime) {
    tasks =
        _taskRepository.findAllFromDate(formatDate(dateTime)).asObservable();
  }
}
