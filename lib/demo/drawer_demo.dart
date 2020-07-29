import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          /*DrawerHeader(
                child: Text('header'.toUpperCase()),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
              ),*/
          //用户相关账户信息
          UserAccountsDrawerHeader(
            accountName: Text('wangweikang', style: TextStyle(fontWeight: FontWeight.bold),),
            accountEmail: Text('1263195113@qq.com'),
            //用户头像
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596020718837&di=67b151aec4362e483f12fb53a56d3b5b&imgtype=0&src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F92386f0672e76761eae4da6308849c81e57cbfd4.jpg'),
            ),
            //设置背景
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                  image: NetworkImage('https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1028337580,1291065723&fm=26&gp=0.jpg'),
                  //图像填充，BoxFit.cover：填满整个区域
                  fit: BoxFit.cover,
                  //滤镜，blendMode：混合模式
                  colorFilter: ColorFilter.mode(
                      Colors.yellow[400].withOpacity(0.6),
                      BlendMode.hardLight)
              ),
            ),
          ),
          ListTile(
            //title:标题， textAlign :对齐方式
            title: Text('Messages', textAlign: TextAlign.right,),
            //trailing: 标题右边显示，leading:标题左边显示
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0,),
            //点击事件, Navigator.pop(context): 关闭抽屉
            onTap: () => Navigator.pop(context) ,
          ),
          ListTile(
            //title:标题， textAlign :对齐方式
            title: Text('Favorite', textAlign: TextAlign.right,),
            //trailing: 标题右边显示，leading:标题左边显示
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0,),
            onTap: () => Navigator.pop(context) ,
          ),
          ListTile(
            //title:标题， textAlign :对齐方式
            title: Text('Settings', textAlign: TextAlign.right,),
            //trailing: 标题右边显示，leading:标题左边显示
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0,),
            onTap: () => Navigator.pop(context) ,
          ),
        ],
      ),
    );
  }
}
