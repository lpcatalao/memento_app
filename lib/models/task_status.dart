class TaskStatus {

  final int _completed;
  final int _total;


  TaskStatus(this._completed, this._total);

  int get completed => _completed;

  int get total => _total;

  double get percent => _total / _completed;


}
