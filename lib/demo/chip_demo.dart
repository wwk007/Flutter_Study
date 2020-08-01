import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon',
  ];

  String _action = 'Nothing';
  List<String> _selected = [];
  String _choice = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16.0, top: 0.0, right: 16.0, bottom: 0.0),
        //padding: EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Wrap:超出一行后会另起一行显示，解决超出问题;wrap本身可以设置小部件的间隔
            Wrap(
              spacing: 8.0,//列间距
              runSpacing: 8.0,//设置行间距
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('wangweikang'),
                  backgroundColor: Colors.orange,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('王'),
                  ),
                ),
                Chip(
                  label: Text('wangweikang'),
                  backgroundColor: Colors.orange,
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2495876973,4112326218&fm=26&gp=0.jpg'
                    ),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: (){},//删除按钮
                  deleteIcon: Icon(Icons.delete),//删除按钮图标
                  deleteIconColor: Colors.redAccent,//删除按钮颜色
                  deleteButtonTooltipMessage: 'Remove this tag',//长按删除按钮出现的提示文字
                ),
                Divider(//分割符
                  color: Colors.grey,
                  height: 32.0,
                  indent: 32.0,//左侧缩进
                ),
                Wrap(
                  spacing: 8.0,
                  //_tags.map(): 迭代处理_tags的数据
                  children: _tags.map((tag){
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {//进行数据处理
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                //ActionChip
                Divider(//分割符
                  color: Colors.grey,
                  height: 32.0,
                  indent: 32.0,//左侧缩进
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_action'),
                ),
                Wrap(
                  spacing: 8.0,
                  //_tags.map(): 迭代处理_tags的数据
                  children: _tags.map((tag){
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                //FilterChip
                Divider(//分割符
                  color: Colors.grey,
                  height: 32.0,
                  indent: 32.0,//左侧缩进
                ),
                Container(
                  width: double.infinity,
                  child: Text('FilterChip: ${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  //_tags.map(): 迭代处理_tags的数据
                  children: _tags.map((tag){
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),//是否被选中，被选中会显示选中按钮
                      onSelected: (value) {//点击事件
                        setState(() {
                          if(_selected.contains(tag)){
                            _selected.remove(tag);
                          }else{
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                //ChoiceChip
                Divider(//分割符
                  color: Colors.grey,
                  height: 32.0,
                  indent: 32.0,//左侧缩进
                ),
                Container(
                  width: double.infinity,
                  child: Text('ChoiceChip: ${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  //_tags.map(): 迭代处理_tags的数据
                  children: _tags.map((tag){
                    return ChoiceChip(
                      label: Text(tag),
                      selectedColor: Colors.black,//选中的颜色
                      selected: _choice == tag,//是否被选中
                      onSelected: (value) {//点击事件
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Lemon',
            ];
          });

          _selected = [];

          _choice = 'Lemon';
        },
      ),
    );
  }
}
