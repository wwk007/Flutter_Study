import 'package:flutter/material.dart';
import '../model/post.dart';

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

    @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;
    @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;//行数不确定设为true；行数确定设为true
    @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;//选中行数
    @override
  DataRow getRow(int index) {//每行具体的内容
    // TODO: implement getRow
    final Post post = _posts[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ]
    );
  }

  void _sort(getField(post), bool ascending){
      _posts.sort((a,b) {
        if(!ascending){
          final c = a;
          a = b;
          b = c;
        }

        final aValue = getField(a);//getField返回值(post) => post.title.length
        final bValue = getField(b);
        return Comparable.compare(aValue, bValue);
      });

      notifyListeners();
  }

}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = false;

  final PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Posts'),
              rowsPerPage: 5,//每页的行数，默认10
              source: _postDataSource,//表格中的数据
              sortColumnIndex: _sortColumnIndex,//按照排序的列
              sortAscending: _sortAscending,//true：升序排列，false:降序排列, 默认升序
              //onSelectAll: (bool value) {},//全选的动作，value：全选的状态
              columns: [
                DataColumn(
                  label: Text('Title'),
                  //点击标签执行onSort。index:标签索引，ascending：点击后的排序bool值
                  onSort: (int columnIndex, bool ascending) {
                    //数据排序的实现
                    _postDataSource._sort((post) => post.title.length, ascending);
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
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

            ),
          ],
        ),
      ),
    );
  }
}
