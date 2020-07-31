import 'package:flutter/material.dart';
import './demo/bottom_navigation_bar_demo.dart';
import './demo/drawer_demo.dart';
import './demo/listview_demo.dart';
import './demo/basic_demo.dart';
import './demo/hello_demo.dart';
import './demo/layout_demo.dart';
import './demo/view_demo.dart';
import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart';
import './demo/form_demo.dart';
import './demo/material_components.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      //去除右上角debug条幅
      debugShowCheckedModeBanner: false,
      //home :设置首页； appbar顶部工具栏
      //home: NavigatorDemo(),
      //初始路由
      initialRoute: '/mdc',
      routes: {
        '/': (context) => Home(),
        '/about' : (context) =>  PageDemo(title: 'About',),
        '/form' : (context) =>  FormDemo(),
        '/mdc' : (context) =>  MaterialComponents(),
      },
      theme: ThemeData(
        //primarySwatch:主題顏色；頂部、底部导航栏颜色
        primarySwatch: Colors.yellow,
        //点击按钮后矩形框的颜色
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        //点击按钮后水波纹的颜色
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      //tab标签个数
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          //leading: 左侧图标, 不设置左侧图标点击可以默认打开抽屉
          /*leading: IconButton(
            icon: Icon(Icons.menu),
            //长按后显示
            tooltip: 'Navigation',
            onPressed: () => debugPrint('Navigation button is pressed'),
          ),*/
          title: Text('Hello Flutter'),
          centerTitle: true,
          //leading: 右侧图标，可以添加一组图标
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => debugPrint('Search button is pressed'),
            ),
            /*IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: 'More',
              onPressed: () => debugPrint('More button is pressed'),
              ),*/
            ],
          elevation: 30.0,
          //Tab:标签,TabBar:标签栏,TabBarView:标签内容，TabController:把标签跟标签内容链接在一起
          bottom: TabBar(
            //未选定标签颜色
            unselectedLabelColor: Colors.black38,
            //选定标签下指示器的颜色，54:透明度
            indicatorColor: Colors.black54,
            //指示器长度跟标签长度一致
            indicatorSize: TabBarIndicatorSize.label,
            //指示器粗细
            indicatorWeight: 1.0,

            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist),),
              Tab(icon: Icon(Icons.change_history),),
              Tab(icon: Icon(Icons.directions_bike),),
              Tab(icon: Icon(Icons.view_quilt),),
              Tab(icon: Icon(Icons.view_array),),
            ],
          ),
        ),
        body:TabBarView(
          children: <Widget>[
            ListViewDemo(),
            //Icon(Icons.local_florist, size: 128.0, color: Colors.black12,),
            //Icon(Icons.change_history, size: 128.0, color: Colors.black12,),
            BasicDemo(),
            //Icon(Icons.directions_bike, size: 128.0, color: Colors.black12,),
            LayoutDemo(),
            ViewDemo(),
            SliverDemo(),
          ],
        ),
        //右边抽屉
        //endDrawer: Text('This is a drawer'),
        //左边抽屉
        /*drawer: Container(
          color: Colors.white,
          padding: EdgeInsets.all(8.0),
          child: Column(
            //主轴对齐
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('This is a drawer'),
            ],
          ),
        ),*/
        drawer: DrawerDemo(),
        //当底部导航栏item > 4,导航栏类型会发生变化
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}

