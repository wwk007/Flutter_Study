import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class HttpDartIoDemo  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDartIoDemo'),
        elevation: 0.0,
      ),
      body: MyHomePage(),
    );
  }
}

class HttpDartIoDemoHome extends StatefulWidget {
  @override
  _HttpDartIoDemoHomeState createState() => _HttpDartIoDemoHomeState();
}

class _HttpDartIoDemoHomeState extends State<HttpDartIoDemoHome> {

  get() async {
    var httpClient = new HttpClient();
    var uri = new Uri.http(
        'example.com', '/path1/path2', {'param1': '42', 'param2': 'foo'});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    //var responseBody = await response.transform(UTF8.decoder).join();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));//发起请求, 等待请求
      var response = await request.close();//关闭请求, 等待响应
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();//解码响应的内容.
        var data = jsonDecode(json);
        result = data['origin'];
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            spacer,
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text('Get IP address'),
            ),
          ],
        ),
      ),
    );
  }
}
