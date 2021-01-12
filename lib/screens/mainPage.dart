import 'dart:async';

import 'package:blocExample/screens/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:blocExample/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocExample/bloc/main_bloc.dart';

final nameController = TextEditingController();
final passController = TextEditingController();

class MainFormPage extends StatefulWidget {
  @override
  _MainFormPageState createState() => _MainFormPageState();
}

class _MainFormPageState extends State<MainFormPage> {
  final formKey = GlobalKey<FormState>();
  String errorText;

//  regex(bool obscureText, TextEditingController controller, String errorText) {
//     var regexp = RegExp(
//         r"(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{8,}");

//     if (controller.text.length < 8 && controller.text.isNotEmpty) {
//       return errorText = "Your name or pass so short, need 8 simbols or more";
//     }

//     if (obscureText == true) {
//       if (regexp.hasMatch(controller.text) == false &&
//           controller.text.isNotEmpty) {
//         return errorText = "incorect pass";
//       }
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              BlocBuilder<MainBloc, MainState>(
                builder: (context, state) {
                  if (state is DefaultState) {
                    return Column(
                      children: [
                        buildField(
                            false, "name", "enter name", nameController, null),
                        buildField(
                            true, "pass", "enter pass", passController, null),
                      ],
                    );
                  }
                  if (state is IncorectFieldValueState) {
                    if (state is LoadingState) {
                      return CircularProgressIndicator();
                    }
                    return Column(
                      children: [
                        buildField(false, "name", "enter name", nameController,
                            "incorect name or pass"),
                        buildField(false, "pass", "enter pass", passController,
                            "incorect name or pass")
                      ],
                    );
                  }
                  if (state is ShortFieldValueState) {
                    return Column(
                      children: [
                        buildField(false, "name", "enter name", nameController,
                            state.errorText),
                        buildField(true, "pass", "enter pass", passController,
                            state.errorText)
                      ],
                    );
                  }
                  if (state is LoadingState) {
                    return Stack(
                      children: [LoadingScreen()],
                    );
                  }
                },
              ),
              BuildButton(),
              BlocBuilder<MainBloc, MainState>(builder: (context, state) {
                if (state is LoginedState) {
                  return Text(state.value);
                }
                return Text("not logined");
              })
            ],
          ),
        ),
      ),
    );
  }
}
