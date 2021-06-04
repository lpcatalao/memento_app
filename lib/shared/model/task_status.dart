class TaskStatus {
  int _completed;
  int _total;

  TaskStatus(this._completed, this._total);

  set completed(int value) {
    _completed = value;
  }

  int get completed => _completed;

  int get total => _total;

  double get percent => _total / _completed;

  @override
  String toString() {
    return 'TaskStatus{_completed: $_completed, _total: $_total}';
  }

  set total(int value) {
    _total = value;
  }
}
