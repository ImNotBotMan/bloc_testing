part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class DefaultState extends MainState {}

class LoginedState extends MainState {
  final String value;

  LoginedState(this.value);
}

class ErrorValueState extends MainState {}

class IncorectFieldValueState extends ErrorValueState {}

class ShortFieldValueState extends ErrorValueState {
  final String errorText;
  ShortFieldValueState(this.errorText);
}

class NextPageState extends MainState {}

class LoadingState extends MainState {
  final String name;
  final String pass;

  LoadingState(this.name, this.pass);
}
