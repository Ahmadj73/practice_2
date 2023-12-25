import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/page/welcome/bloc/welcome_events.dart';
import 'package:udemy/page/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
