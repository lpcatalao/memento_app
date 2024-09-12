import 'package:memento_app/shared/model/task_status.dart';

class DashboardPageViewItem {
  final double _width;
  final double _height;
  final String _period;
  final List<TaskStatus> _status;

  DashboardPageViewItem(this._width, this._height, this._period, this._status);

  double get width => _width;

  double get height => _height;

  List<TaskStatus> get status => _status;

  String get period => _period;
}
