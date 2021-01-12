import 'package:blocExample/screens/loading_screen.dart';
import 'package:blocExample/screens/logined_screen.dart';
import 'package:blocExample/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/main_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MainBloc(),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if (state is DefaultState) {
              return MainScreen();
            }
            if (state is LoginedPageState) {
              return LoginedScreen();
            }
            return LoadingScreen();
          },
        ));
  }
}
