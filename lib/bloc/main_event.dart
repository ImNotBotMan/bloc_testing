part of 'main_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MainEvent extends AuthEvent {
  final String name;
  final String pass;

  MainEvent(this.name, this.pass);
}

class NextPageEvent extends AuthEvent {}
