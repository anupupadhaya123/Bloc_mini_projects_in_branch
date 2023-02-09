import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterInitial> {
  CounterCubit() : super(CounterInitial(counterValue: 0));

  void increment() {
    emit(CounterInitial(counterValue: state.counterValue + 1));
  }

  void decrement() {
    emit(CounterInitial(counterValue: state.counterValue - 1));
  }
}
