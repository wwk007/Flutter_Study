import 'package:flutter/material.dart';
import '../model/post.dart';

//sliver：一小块可视口
class SliverDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //title: Text('WANGWEIKANG'),
            centerTitle: true,//title居中
            //pinned: true,//固定sliverappbar在顶部
            floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(//伸展
              title: Text(
                'WangWeiKang Flutter'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0, //字间距
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(//背景图像
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596105164167&di=4d67f138b1e994cce8572dacd4417a5f&imgtype=0&src=http%3A%2F%2Fimg2-cloud.itouchtv.cn%2Ftvtouchtv%2Fimage%2F20180907%2Ftouchtv70-1536328389496664.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(//代码在安全的区域内显示，不会被遮挡
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverGridDemo(),
            ),
          )
        ],
      ),
    );
  }
}

//列表视图
class SliverListDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index){
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
               elevation: 14.0,
              //withOpacity: 设置透明度
               shadowColor: Colors.grey.withOpacity(0.5),
               child: Stack(
                 children: <Widget>[
                   AspectRatio(
                     aspectRatio: 16/9,
                     child: Image.network(
                       posts[index].imageUrl,
                       fit: BoxFit.cover,
                     ),
                   ),
                   Positioned(
                     top: 32.0,
                     left: 32.0,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text(
                           posts[index].title,
                           style: TextStyle(
                             fontSize: 20.0,
                             color: Colors.white,
                           ),
                         ),
                         Text(
                           posts[index].author,
                           style: TextStyle(
                             fontSize: 13.0,
                             color: Colors.white,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
            ),
          );
        },
        childCount: posts.length,//item数量
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0, //控制网格视图项目的比例默认1.0 。<1.0:主轴拉伸，越小拉伸越大, >1.0:主轴压缩，越大压缩越大
      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index){
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length,//item数量
      ),
    );
  }
}
