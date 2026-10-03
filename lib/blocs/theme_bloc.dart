import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  ThemeBloc() : super(false) {
    on<ToggleTheme>((event, emit) {
      emit(!state);
    });
  }
}
