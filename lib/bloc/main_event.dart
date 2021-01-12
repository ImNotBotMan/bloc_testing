part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthEvent extends MainEvent {}

class OutEvent extends MainEvent {}
