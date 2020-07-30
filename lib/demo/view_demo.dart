import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget{
  Widget _gridItemBuilder(BuildContext context, int index){
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,//填充模式
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      /*gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(//相当于Gridview.count
        crossAxisCount: 4,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),*/
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(//相当于Gridview.count
        maxCrossAxisExtent: 150.0,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }

}

//网格视图
class GridViewExtentDemo extends StatelessWidget{
  List<Widget> _buildTiles(int length){
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0,0.0),
        child: Text(
          'Item $index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
      maxCrossAxisExtent: 150.0,//视图在交叉轴上的最大尺寸
      crossAxisSpacing: 16.0, //交叉轴item间距
      mainAxisSpacing: 16.0, //主轴item间距
      //scrollDirection: Axis.horizontal, //主轴方向
      children: _buildTiles(100),
    );
  }
}

//网格视图
class GridViewCountDemo extends StatelessWidget{
  List<Widget> _buildTiles(int length){
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0,0.0),
        child: Text(
          'Item $index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 3,//GridView默认垂直显示，crossAxis交叉轴为横轴
      crossAxisSpacing: 16.0, //交叉轴item间距
      mainAxisSpacing: 16.0, //主轴item间距
      //scrollDirection: Axis.horizontal, //主轴方向
      children: _buildTiles(100),
    );
  }
}


//PageView.builder: 按需生成页面
class PageViewBuilderDemo extends StatelessWidget{
  Widget _pageItemBuilder(BuildContext context, int index){
    return Stack(
      children: <Widget>[
        //expand：填满所有可用空间
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].author,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }

}

class PageViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      //pageSnapping: true:页面自动滚动;false:页面不自动滚动
      //pageSnapping: false,
      //reverse:倒置，页面顺序取反，最后一个变成第一个，123变成321
      //reverse: true,
      //scrollDirection: 滚动方向，默认水平
      scrollDirection: Axis.vertical,
      //currentPage: 页面索引号
      onPageChanged: (currentPage) => debugPrint('Page: $currentPage'),
      controller: PageController(
        initialPage: 1,//默认显示页面，默认为0
        keepPage: false,//记录用户进入的页面，默认为true , 不太理解怎么用
        viewportFraction: 0.85,//占用可视口
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'ONE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'TWO',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'THREE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }

}