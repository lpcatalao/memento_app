const TASK_ID = 'taskId';
const TASK_TEXT = 'taskText';
const TASK_DATEMILLIS = 'taskDateMillis';
const TASK_HOUR = 'taskHour';
const TASK_MIN = 'taskMin';
const TASK_STATUS = 'taskStatus';
const TASK_TYPE = 'taskType';

class Task {
  int _id;
  String _text;
  int _dateMilli;
  int _hour;
  int _min;
  bool _status = false;
  String _type;

  Task(this._text, this._dateMilli, this._hour, this._min, this._type);

  String get type => _type;

  int get min => _min;

  int get hour => _hour;

  int get dateMilli => _dateMilli;

  String get text => _text;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  set status(bool value) {
    _status = value;
  }

  bool get status => _status;

  Map<String, dynamic> toMap() {
    return {
      TASK_ID: _id,
      TASK_TEXT: _text,
      TASK_DATEMILLIS: _dateMilli,
      TASK_HOUR: _hour,
      TASK_MIN: _min,
      TASK_STATUS: _status,
      TASK_TYPE: _type,
    };
  }

  @override
  String toString() {
    return 'Task{_id: $_id, _text: $_text, _dateMilli: $_dateMilli, _hour: $_hour, _min: $_min, _status: $_status, _type: $_type}';
  }
}
