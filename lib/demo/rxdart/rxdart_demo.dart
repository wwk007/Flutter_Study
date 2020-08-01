import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartHomeDemo(),
    );
  }
}

class RxDartHomeDemo extends StatefulWidget {
  @override
  _RxDartHomeDemoState createState() => _RxDartHomeDemoState();
}

class _RxDartHomeDemoState extends State<RxDartHomeDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*Stream<String> _streamDemo =
        //Stream.fromIterable(['hello','您好']);
        //Stream.fromFuture(Future.value('hello ~'));
        Stream.periodic(Duration(seconds: 3), (x) => x.toString());//间隔3s持续显示数据，x:当前重复的次数

    _streamDemo.listen(print);*/

    //PublishSubject:按顺序给监听添加数据。先加数据，后加监听，则监听不会收到数据
    //PublishSubject<String> _subject = PublishSubject<String>();

    //BehaviorSubject:可以把最后一次添加的数据作为第一个添加给新来的监听；先加数据，再加监听，监听会收到上面最后一次添加的数据
    //BehaviorSubject<String> _subject = BehaviorSubject<String>();

    //ReplaySubject:把添加的数据全部交给监听器,监听器会收到所有的数据
    //maxSize: 2 :监听器接收的最大数据个数
    ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);

    _subject.add('hello ~');//添加数据
    _subject.add('hola ~');//添加数据
    _subject.add('hi ~');//添加数据
    _subject.listen((data) => print('listen 1: $data'));
    _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));

    _subject.close();//关闭subject
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

