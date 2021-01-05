import 'package:flutter/material.dart';
import 'package:blocExample/withOutlibraryBloc.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  CounterBloc _bloc = CounterBloc();

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
              initialData: 0,
              builder: (context, snapshot) {
                return Text("${snapshot.data}");
              },
            )),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _bloc.inputEventSink.add(numEvent.increment);
                  },
                  backgroundColor: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    _bloc.inputEventSink.add(numEvent.decrement);
                  },
                  backgroundColor: Colors.green,
                )
              ],
            )),
      ),
    );
  }
}
