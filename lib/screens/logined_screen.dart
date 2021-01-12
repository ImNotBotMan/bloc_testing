import 'package:blocExample/bloc/main_bloc.dart';
import 'package:blocExample/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("demo"),
          centerTitle: true,
        ),
        backgroundColor: Colors.green,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("you a logined"),
            BuildButton(OutEvent()),
          ]),
        ));
  }
}
