import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/main_bloc.dart';
import '../screens/mainPage.dart';
import '../screens/loadingScreen.dart';

Widget buildField(bool obscureText, String label, String hint,
    TextEditingController controller, errorText) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      errorText: errorText,
    ),
  );
}

class BuildButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainBloc blocA = BlocProvider.of(context);
    return RaisedButton(
        child: Text("login"),
        onPressed: () {
          print(nameController.text + " <name - pass> " + passController.text);
          blocA.add(MainEvent(nameController.text, passController.text));
        });
  }
}
