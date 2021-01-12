import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocExample/screens/loadingScreen.dart';
import 'package:equatable/equatable.dart';
part 'main_event.dart';
part 'main_state.dart';

var passPattern =
    RegExp(r"(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{8,}");

var namePattern = RegExp(r"(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}");

class MainBloc extends Bloc<AuthEvent, MainState> {
  MainBloc() : super(DefaultState());

  @override
  Stream<MainState> mapEventToState(AuthEvent event) async* {
    if (event is MainEvent) {
      String pass = event.pass;
      String name = event.name;
      yield LoadingState(name, pass);
      await Future.delayed(Duration(seconds: 1));
      yield* _checking(event, pass, name);
    }
  }
}

Stream<MainState> _checking(AuthEvent event, String pass, String name) async* {
  if (name.length < 8 || pass.length < 8) {
    yield ShortFieldValueState("short value");
  }
  if ((namePattern.hasMatch(name) == false && name.length >= 8) ||
      (passPattern.hasMatch(pass) == false && pass.length >= 8)) {
    yield IncorectFieldValueState();
  }
}
