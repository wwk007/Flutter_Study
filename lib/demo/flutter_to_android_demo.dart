import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class FlutterToAndroidDemo extends StatefulWidget {
  @override
  _FlutterToAndroidDemoState createState() => _FlutterToAndroidDemoState();
}

class _FlutterToAndroidDemoState extends State<FlutterToAndroidDemo> {
  //1.定义MethodChannel，参数要与原生app中MethodChannel的参数一致，可以任意写
  //MethodChannel methodChannel = MethodChannel('song.test.com.myapplication');

  //static const platform = const MethodChannel("com.test/name");

  /*String result = '';
  void onClick() async {
    final String result = await methodChannel.invokeMethod('showToast');

    setState(() {
      this.result = result;
    });
  }*/
  bool result = false;

  static const String chanel = "back/desktop";
  //返回手机桌面事件
  static const String eventBackDesktop = "backDesktop";
  Future<bool> isEuropeUser() async {
    // Native channel
    final platform = MethodChannel(chanel); //分析1
    try {
      result = await platform.invokeMethod(eventBackDesktop); //分析2
      print('result: $result');
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter与原生界面交互'),
        elevation: 0.0,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('$result'),
              RaisedButton(
                onPressed: isEuropeUser,
                child: Text('点击'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

