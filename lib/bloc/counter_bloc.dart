import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState()) {
    on<Ingrement>((event, emit) {
      return emit(CounterState(count: state.count + 1));
    });
    on<Decrement>((event, emit) {
      if (state.count > 0) {
        return emit(CounterState(count: state.count - 1));
      }
    });
  }
}
