import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/main_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc()..add(CheckAuthDataEvent()),
      child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        if (state is AuthState) {
          return AuthScreen();
        }
        if (state is ProfileState) {
          return ProfileScreen(state.userId);
        }
        return Center(child: Text("loading..."));
      }),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text("authScreen"),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String userid;
  ProfileScreen(this.userid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: Container(
          color: Colors.green,
          child: Text("profile $userid"),
        ),
      ),
    );
  }
}
