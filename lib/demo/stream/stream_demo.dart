import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  String _data = '...';

  @override
  void dispose() {//移除小部件时使用
    // TODO: implement dispose
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {//初始化小部件时使用
    // TODO: implement initState
    super.initState();
    print('Create a stream');
    //Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    //_streamDemo = StreamController<String>();单次订阅
    _streamDemo = StreamController.broadcast();//多次订阅
    _sinkDemo = _streamDemo.sink;

    print('Start listening on a stream');
    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);//订阅消息

    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);//订阅消息

    print('Initialize completed');
  }
  //执行完成后调用
  void onDone() {
    print('Done！');
  }
  //报错时调用
  void onError(error) {
    print('Error: $error');
  }
  //_streamDemo有数据时执行onData方法
  void onData(String data) {//data: 表示_streamDemo的数据；
    setState(() {
      _data = data;
    });
    print('$data');
  }

  void onDataTwo(String data) {//data: 表示_streamDemo的数据；
    print('onDataTwo: $data');
  }

  void _pauseStream() {
    print('Pause subscription');
    _streamDemoSubscription.pause();//停止对fetchData数据的订阅，可以用resume恢复订阅
  }

  void _resumeStream() {
    print('Resume subscription');
    _streamDemoSubscription.resume();//恢复对fetchData数据的订阅
  }

  void _cancelStream() {
    print('Cancel subscription');
    _streamDemoSubscription.cancel();//取消对fetchData数据的订阅，取消之后不能使用resume恢复订阅
  }
  
  void _addDataToStream() async{
    print('Add data to stream.');
    String data = await fetchData();
    //_streamDemo.add(data);
    _sinkDemo.add(data);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));//延迟3秒
    return 'hello ~';
    //throw 'Something happened';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Text(_data),
            StreamBuilder(//stream上有数值后执行builder
              stream: _streamDemo.stream,
              initialData: '...',//初始化stream的数据
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },//snapshot.data表示stream属性上的数据
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataToStream,
                ),
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}
