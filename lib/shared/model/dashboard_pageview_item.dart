import 'package:flutter/cupertino.dart';
import 'package:memento_app/models/task_status.dart';

class DashboardPageViewItem {
  final double _width;
  final double _height;
  final BoxConstraints _constraints;
  final String _period;
  final List<TaskStatus> _status;

  DashboardPageViewItem(
      this._width, this._height, this._constraints, this._period, this._status);

  double get width => _width;

  double get height => _height;

  BoxConstraints get constraints => _constraints;

  List<TaskStatus> get status => _status;

  String get period => _period;
}
