import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //color: Colors.grey[100],
      decoration: BoxDecoration(
        image: DecorationImage(
          image:  NetworkImage('https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=254703792,2534929922&fm=26&gp=0.jpg'),
          alignment: Alignment.topCenter,
          //设置重复
          //repeat: ImageRepeat.repeatY,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            //滤镜用的颜色,withOpacity:设置不透明度
            Colors.indigoAccent[400].withOpacity(0.5),
            BlendMode.hardLight
          )
        ),
      ),
      child: Row(
        //设置对齐
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white,),
            //color: Color.fromRGBO(3, 54, 255, 1.0),
            //padding: EdgeInsets.only(left: 24.0, right: 8.0, ),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              //不能同时出现2个color属性，需要去掉container的color属性
              color: Color.fromRGBO(3, 54, 255, 1.0),
             /* //单独设置边框
              border: Border(
                top: BorderSide(
                  color: Colors.indigoAccent[100],
                  width: 3.0,
                  //solid:实线
                  style: BorderStyle.solid,
                ),
                bottom: BorderSide(
                  color: Colors.indigoAccent[100],
                  width: 3.0,
                  //solid:实线
                  style: BorderStyle.solid,
                ),
              ),*/
              //同时设置边框
              border: Border.all(
               color: Colors.indigoAccent[100],
               width: 3.0,
               //solid:实线
               style: BorderStyle.solid,
             ),
              //同时设置4个圆角
              //borderRadius:BorderRadius.circular(16.0),
              /*//单独设置圆角
              borderRadius:BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
              ),*/
              boxShadow: [
                BoxShadow(
                  //阴影偏移，x轴偏移量，y轴偏移量
                  offset: Offset(0.0,16.0),
                  color: Color.fromRGBO(16, 20, 188, 1.0),
                  //模糊程度，值越大越模糊
                  blurRadius: 25.0,
                  //控制阴影面积，正值：扩大，负值：缩小
                  spreadRadius: -9.0,
                )
              ],
              //设置形状，圆形盒子上不能使用圆角效果
              shape: BoxShape.circle,
              //镜像渐变
              /*gradient: RadialGradient(
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 28, 128, 1.0),
                ]
              ),*/
              //线性渐变,从左到右
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                //渐变开始，结束为止
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),


            ),
          ),
        ],
      ),
    );
  }
}

//RichText:一行文字显示多种样式
class RichTextDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(
          text: 'wangweikang',
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 34.0,
            //斜体
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w100,
          ),
          children: [
            TextSpan(
              text: '.net',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.grey,
              ),
            ),
          ]
      ),
    );
  }
}

class TextDemo extends StatelessWidget{
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );

  final String _author = '杜甫';
  final String _title = '望岳';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      '《 $_title》- $_author。岱宗夫如何？齐鲁青未了。造化钟神秀，阴阳割昏晓。荡胸生曾云，决眦入归鸟。会当凌绝顶，一览众山小。',
      textAlign: TextAlign.left,
      /*style: TextStyle(
        fontSize: 16.0,
      ),*/
      //_textStyle, 下划线表示在类里私有
      style: _textStyle,
      maxLines: 2,
      //溢出部分样式，TextOverflow.ellipsis：省略号
      overflow: TextOverflow.ellipsis,
    );
  }

}