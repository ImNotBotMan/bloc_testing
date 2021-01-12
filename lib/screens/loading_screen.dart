import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      appBar: AppBar(
        title: Text("demo"),
        centerTitle: true,
      ),
      body: Center(
          child: SizedBox(
              height: 50, width: 50, child: CircularProgressIndicator())),
    );
  }
}
