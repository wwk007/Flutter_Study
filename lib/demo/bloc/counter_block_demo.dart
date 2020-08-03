import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/demo/layout_demo.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return Center(
      child: StreamBuilder(//StreamBuilder构建了一个小部件，stream上的数据有变化，就会重新构建小部件
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),//snapshot.data: _counterBloc.count上的数据
            onPressed: () {
              //_counterBloc.log();
              _counterBloc.counter.add(1);
            },
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        //_counterBloc.log();
        _counterBloc.counter.add(1);
      },
    );
  }
}

class CounterBloc {
  int _count = 0;

  final _counterActionController = StreamController<int>();
  //get方法, 方法名字counter
  StreamSink<int> get counter => _counterActionController.sink;

  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
    //_counterActionController.stream.listen(onData);
  }

  void onData(int data) {//data: stream上的数据
    print('$data');
    _count = data + _count;
    _counterController.add(_count);
  }

  void dispose() {
    _counterActionController.close();
    _counterController.close();
  }

  void log() {
    print('Bloc');
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  CounterProvider({
    this.child,
    this.bloc
  }) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}