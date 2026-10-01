import 'package:bloc_project/counter/bloc_event.dart';
import 'package:bloc_project/counter/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(value: 12, input: 0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(value: state.value + state.input, input: state.input));
    });

    on<DecrementEvent>((event, emit) {
      emit(CounterState(value: state.value - state.input, input: state.input));
    });

    on<ResetEvent>((event, emit) {
      emit(CounterState(value: 12, input: state.input));
    });

    on<ClearInputEvent>((event, emit) {
      emit(CounterState(value: state.value, input: 0));
    });

    on<InputChangedEvent>((event, emit) {
      emit(CounterState(value: state.value, input: state.input));
    });
  }
}
