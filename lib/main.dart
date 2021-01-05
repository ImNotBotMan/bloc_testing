import 'package:blocExample/withOutlibraryBloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  ColorBloc _bloc = ColorBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("title"),
              centerTitle: true,
              backgroundColor: Colors.indigo,
            ),
            body: Center(
              child: StreamBuilder(
                stream: _bloc.outputStateStream,
                initialData: Colors.red,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return AnimatedContainer(
                    width: 100,
                    height: 100,
                    color: snapshot.data,
                    duration: Duration(microseconds: 500),
                  );
                },
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _bloc.inputEventSink.add(colorEvent.event_red);
                  },
                  backgroundColor: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    _bloc.inputEventSink.add(colorEvent.event_green);
                  },
                  backgroundColor: Colors.green,
                )
              ],
            )),
      ),
    );
  }
}
