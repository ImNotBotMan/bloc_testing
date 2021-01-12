import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocExample/bloc/main_bloc.dart';

class BuildButton extends StatelessWidget {
  final event;
  BuildButton(this.event);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MainBloc>(context);
    return RaisedButton(
        child: Text("logIn"),
        onPressed: () {
          bloc.add(event);
        });
  }
}
