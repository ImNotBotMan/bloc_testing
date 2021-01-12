import 'package:blocExample/screens/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/main_bloc.dart';
import 'package:blocExample/screens/mainPage.dart';
import 'screens/nextPage.dart';

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
            if (state is MainState) {
              if (state is LoadingState) {
                return LoadingScreen();
              }
              return MainFormPage();
            }
          },
        ));
  }
}
