import 'dart:async';

class OnboardingBloc {
  final _stateController = StreamController<int>.broadcast();

  StreamSink<int> get stateSink => _stateController.sink;

  Stream<int> get stateStream => _stateController.stream;

  //Deve fechar o os stream para que não ocorra um problema de vazamento de memória
  dispose() {
    _stateController.close();
  }
}
