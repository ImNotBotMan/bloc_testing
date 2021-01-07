part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class LoadingState extends MainState {}

class AuthState extends MainState {}

class ProfileState extends MainState {
  final String userId;

  ProfileState(this.userId);
}
