import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _checkboxItemA = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckboxDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckboxListTile(//未勾选时value是true, 勾选是false
              value: _checkboxItemA,
              onChanged: (value){
                setState(() {
                  print(_checkboxItemA);
                  _checkboxItemA = value;
                });
              },
              title: Text('Checkbox Item A'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.bookmark),//图标
              selected: _checkboxItemA,//checkbox是否被激活
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               /* Checkbox(//默认颜色是主题里的accentColor
                  value: _checkboxItemA,
                  onChanged: (value){//value:代表checkbox勾选的状态
                    setState(() {
                      _checkboxItemA = value;
                    });
                  },
                  activeColor: Colors.black,//勾选状态的颜色
                ),*/
              ],
            )
          ],
        ),
      ),
    );
  }
}
