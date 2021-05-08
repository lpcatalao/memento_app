import 'dart:async';

import 'package:memento_app/utilities/datetime_formatter.dart';

enum TimeDate { DATE, TIME }

class TimeDateBloc {
  final _eventController = StreamController<DateTime>();

  StreamSink<DateTime> get eventSink => _eventController.sink;

  Stream<DateTime> get _eventStream => _eventController.stream;

  final _stateController = StreamController<String>();

  StreamSink<String> get _stateSink => _stateController.sink;

  Stream<String> get stateStream => _stateController.stream;

  TimeDateBloc() {
    _eventStream.listen((date) {
      _stateSink.add(formatDate(date));
    });
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
