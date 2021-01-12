part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class DefaultState extends MainState {}

class LoadingState extends MainState {}

class LoginedPageState extends MainState {}
