abstract class CounterEvent {
  final int counterValue;
  const CounterEvent({required this.counterValue});
}

class IncrementEvent extends CounterEvent {
  const IncrementEvent() : super(counterValue: 1);
}

class DecrementEvent extends CounterEvent {
  const DecrementEvent() : super(counterValue: -1);
}

class ResetEvent extends CounterEvent {
  ResetEvent({required super.counterValue});
}

class ClearInputEvent extends CounterEvent {
  ClearInputEvent({required super.counterValue});
}

class InputChangedEvent extends CounterEvent {
  final int input;

  InputChangedEvent(
    int parse, {
    required super.counterValue,
    required this.input,
  });
}
