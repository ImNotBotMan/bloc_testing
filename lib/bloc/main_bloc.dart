import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(LoadingState());

  String userId = "assdflkfadpkhasfjksfdkj;";

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is CheckAuthDataEvent) {
      yield* _checkProfileData();
    }
  }

  Stream<MainState> _checkProfileData() async* {
    await Future.delayed(Duration(seconds: 5));
    if (userId.isEmpty) {
      yield AuthState();
    } else
      yield ProfileState(userId);
  }
}

class MainInitial {}
