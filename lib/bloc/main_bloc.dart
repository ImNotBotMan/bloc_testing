import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(DefaultState());

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is AuthEvent) {
      yield LoadingState();
      await Future.delayed(Duration(seconds: 3));
      yield LoginedPageState();
    } else {
      yield LoadingState();
      await Future.delayed(Duration(seconds: 3));
      yield DefaultState();
    }
  }
}
