import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class FlutterToAndroidDemo extends StatefulWidget {
  @override
  _FlutterToAndroidDemoState createState() => _FlutterToAndroidDemoState();
}

class _FlutterToAndroidDemoState extends State<FlutterToAndroidDemo> {
  int _level = 0;
  static const platform = const MethodChannel("com.test/name");

  _getBattery() async {
      final result = await platform.invokeMethod("getBatteryInfo");

      setState(() {
        _level = result;
      });
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
              Text('$_level'),
              RaisedButton(
                child: Text('获取电量'),
                onPressed: _getBattery,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

