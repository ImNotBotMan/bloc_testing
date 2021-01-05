import 'dart:async';

enum numEvent { increment, decrement }

class CounterBloc {
  int _value = 0;

  final _inputEventController = StreamController<numEvent>();
  StreamSink get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController();
  Stream get outputStateStream => _outputStateController.stream;

  void mapEventToState(numEvent event) {
    if (event == numEvent.increment)
      _value += 1;
    else if (event == numEvent.decrement)
      _value -= 1;
    else
      throw Exception("wrong type of event");

    _outputStateController.sink.add(_value);
  }

  CounterBloc() {
    _inputEventController.stream.listen(mapEventToState);
  }
}
