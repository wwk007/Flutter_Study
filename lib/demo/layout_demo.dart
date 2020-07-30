import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        //spaceAround:空間分配在小部件周圍
        mainAxisAlignment: MainAxisAlignment.center,
        //交叉轴
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          //可以给子部件设置限制
          ConstrainedBox(
            //设置限制
            constraints: BoxConstraints(
              minHeight: 200.0,
              maxWidth: 200.0
            ),
            child:  Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}


class AspectRatioDemo extends StatelessWidget{
  //AspectRatio可以设置子部件的宽高比，使用子部件最大的宽度根据宽高比调整部件的高度,3.0/2.0
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
      aspectRatio: 16.0/9.0,
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }

}

//stack 可以存放一堆小部件，小部件会叠加在一起
class StackDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: Container(
            //设置子部件对齐方式, Alignment(0.0,0.0):居中
            alignment: Alignment(0.0,-0.9),
            //alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),

          ),
        ),
        SizedBox(
          height: 32.0,
        ),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              //borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.circle,
              gradient: RadialGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 54, 255, 1.0),
                  ]
              ),
            ),
            child: Icon(Icons.brightness_2, color: Colors.white, size: 32.0,),
          ),
        ),
        //位置小部件
        Positioned(
          //right：右边距，top:上边距
          right: 20.0,
          top: 20.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0,),
        ),
        Positioned(
          //right：右边距，top:上边距
          right: 50.0,
          top: 80.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0,),
        ),
        Positioned(
          //right：右边距，top:上边距
          right: 20.0,
          top: 120.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0,),
        ),
        Positioned(
          //right：右边距，top:上边距
          right: 70.0,
          top: 180.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0,),
        ),
        Positioned(
          //right：右边距，top:上边距
          right: 30.0,
          top: 230.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0,),
        ),
        Positioned(
          //right：右边距，top:上边距
          right: 90.0,
          top: 250.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0,),
        ),
        Positioned(
          //right：右边距，top:上边距
          right: 10.0,
          top: 280.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0,),
        ),
      ],
    );
  }
}

class IconBadge extends StatelessWidget{
  final IconData icon;
  final double size;

  IconBadge(this.icon, {
    this.size = 32.0,
  });

  @override
  Widget build(BuildContext context) {
   // TODO: implement build
    return Container(
      child: Icon(icon, size: size, color: Colors.white,),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
