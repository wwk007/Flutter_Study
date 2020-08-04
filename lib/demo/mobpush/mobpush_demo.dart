import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobpush_plugin/mobpush_plugin.dart';
import 'notify_page.dart';
import 'dart:io';

class MobpushDemo extends StatefulWidget {
  @override
  _MobpushDemoState createState() => _MobpushDemoState();
}

class _MobpushDemoState extends State<MobpushDemo> {
  String _sdkVersion = 'Unknown';
  String _registrationId = 'Unknown';

  void _onEvent(Object event) {
    print('_onEvent');
  }

  void _onError(Object event) {
    print('_onError');
  }

  Future<void> initPlatformState() async {
    String sdkVersion;
    try {
      sdkVersion = await MobpushPlugin.getSDKVersion();
    } on PlatformException {
      sdkVersion = 'Failed to get platform version.';
    }
    try {
      //获取注册Id
      MobpushPlugin.getRegistrationId().then((Map<String, dynamic> ridMap) {
        print(ridMap);
        setState(() {
          _registrationId = ridMap['res'].toString();
          print('------>#### registrationId: ' + _registrationId);
        });
      });
    } on PlatformException {
      _registrationId = 'Failed to get registrationId.';
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _sdkVersion = sdkVersion;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
    //设置远程推送环境，向用户授权（仅 iOS）
    if (Platform.isIOS) {
      MobpushPlugin.setCustomNotification();
      // 开发环境 false, 线上环境 true
      MobpushPlugin.setAPNsForProduction(false);
    }
    //添加推送回调监听（接收自定义透传消息回调、接收通知消息回调、接收点击通知消息回调、接收别名或标签操作回调）
    MobpushPlugin.addPushReceiver(_onEvent, _onError);
    //设置隐私协议授权状态
    MobpushPlugin.updatePrivacyPermissionStatus(true);
    //设置通知栏icon
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobPush'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('sdk: $_sdkVersion, _registrationId: $_registrationId'),
            RaisedButton(
              child: Text('通知'),
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new NotifyPage())
                  );
                });
              },
            ),
          ],
        ),

      ),
    );
  }
}
