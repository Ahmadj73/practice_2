import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/app_events.dart';
import 'package:udemy/app_states.dart';

class AppBlocs extends Bloc<AppEvent, AppStates> {
  AppBlocs() : super(InitStates()) {
    on<Increment>((event, emit) {
      emit(AppStates(counter: state.counter + 1));
    });
  }
}
