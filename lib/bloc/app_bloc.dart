import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppEvent {}

class ChangeAppState extends AppEvent {}

class AppState {
  final int counter;

  AppState({required this.counter});

  AppState copyWith({int? counter}) {
    return AppState(
      counter: counter ?? this.counter,
    );
  }
}

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState(counter: 0)) {
    on<ChangeAppState>((event, emit) {
      final newState = state.copyWith(counter: state.counter + 1);
      emit(newState);
    });
  }
}
