import 'package:blocExample/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:blocExample/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
        centerTitle: true,
      ),
      body: Center(
        child: BuildButton(AuthEvent()),
      ),
    );
  }
}
