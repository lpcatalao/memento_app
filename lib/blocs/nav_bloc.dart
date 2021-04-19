import 'dart:async';

class NavBloc {
  final _eventController = StreamController<int>();

  StreamSink<int> get eventSink => _eventController.sink;

  Stream<int> get _eventStream => _eventController.stream;

  final _stateController = StreamController<bool>();

  StreamSink<bool> get _stateSink => _stateController.sink;

  Stream<bool> get stateStream => _stateController.stream;

  NavBloc() {
    var isVisible;

    _eventStream.listen((event) {
      if (event > 0) {
        isVisible = true;
      } else {
        isVisible = false;
      }

      _stateSink.add(isVisible);
    });
  }

  //Deve fechar o os stream para que não ocorra um problema de vazamento de memória
  dispose() {
    _eventController.close();
    _stateController.close();
  }
}
