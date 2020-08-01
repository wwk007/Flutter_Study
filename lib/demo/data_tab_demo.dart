import 'package:flutter/material.dart';
import 'package:flutter_app/demo/form_demo.dart';
import '../model/post.dart';

//创建数据表格
class DataTabDemo extends StatefulWidget {
  @override
  _DataTabDemoState createState() => _DataTabDemoState();
}

class _DataTabDemoState extends State<DataTabDemo> {
  int _sortColumnIndex;
  bool _sortAscending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTabDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
           DataTable(
             sortColumnIndex: _sortColumnIndex,//按照排序的列
             sortAscending: _sortAscending,//true：升序排列，false:降序排列, 默认升序
             //onSelectAll: (bool value) {},//全选的动作，value：全选的状态
             columns: [
               DataColumn(
                 label: Text('Title'),
                 //点击标签执行onSort,index:标签索引，ascending：点击后的排序bool值
                 onSort: (int index, bool ascending) {
                   setState(() {
                     _sortColumnIndex = index;
                     _sortAscending = ascending;
                     //print(ascending);
                     posts.sort((a, b){
                      if(!ascending){
                        final c = a;
                        a = b;
                        b = c;
                      }
                      /*print(a.title);
                      print(a.title.length);
                      print(b.title);
                      print(b.title.length);
                      print(a.title.length.compareTo(b.title.length));*/
                      //compareTo返回值：谁小谁在前面
                      //-1:a.title.length < b.title.length  => b往a后面排
                      // 0:a.title.length = b.title.length  => 顺序不变
                      // 1:a.title.length > b.title.length  => b往a前面排
                      return b.title.length.compareTo(a.title.length); //按照标题内容的长度进行排序
                     });
                   });
                 },
                 /*label: Container(
                   width: 150.0,
                   child: Text('Title'),
                 ),*/
               ),
               DataColumn(
                 label: Text('Author'),
               ),
               DataColumn(
                 label: Text('Image'),
               ),
             ],
             rows:
             /*[
               DataRow(
                 cells: [
                   DataCell(Text('hello ~')),
                   DataCell(Text('wangweikang ~')),
                 ],
               ),
               DataRow(
                 cells: [
                   DataCell(Text('hola ~')),
                   DataCell(Text('wangweikang ~')),
                 ],
               ),
               DataRow(
                 cells: [
                   DataCell(Text('您好 ~')),
                   DataCell(Text('wangweikang ~')),
                 ],
               ),

             ]*/
              posts.map((post) {
                return DataRow(
                  selected: post.selected,//行的选择状态
                  onSelectChanged: (bool value) {//value:当前行的选择状态
                    setState(() {
                      if(post.selected != value){
                        post.selected = value;
                      }
                    });
                  },
                  cells: [
                    DataCell(Text(post.title)),
                    DataCell(Text(post.author)),
                    DataCell(Image.network(post.imageUrl)),
                  ],
                );
              }).toList(),
           ),
          ],
        ),
      ),
    );
  }
}
