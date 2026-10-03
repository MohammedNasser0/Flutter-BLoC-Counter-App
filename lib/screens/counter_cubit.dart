import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  // Increase the counter by one.
  void increment() => emit(state + 1);

  // Decrease the counter by one.
  void decrement() => emit(state - 1);
}
