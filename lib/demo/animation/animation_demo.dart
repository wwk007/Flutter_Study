import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationDemoController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationDemoController = AnimationController(//
      /*
      AnimationController：动画值的变化时匀速的
      value：动画初始值
      lowerBound :初始的值,默认0.0
      upperBound :结束的值,默认1.0
      value,lowerBound,upperBound
       */
      /*value: 32.0,//动画初始值,设置之后动画的值就是value -> upperBound
      lowerBound: 32.0, //开始的值，默认0.0
      upperBound: 100.0, //结束的值，默认1.0*/
      duration: Duration(milliseconds: 1000),//时长
      vsync: this,//防止屏幕外的动画消耗不必要的资源, 需加with TickerProviderStateMixin
    );


    curve = CurvedAnimation(parent: animationDemoController, curve: Curves.bounceOut);

    //创建动画范围值
    //animation = Tween(begin: 32.0, end: 100.0).animate(animationDemoController);
    animation = Tween(begin: 32.0, end: 100.0).animate(curve);
    animationColor =
        //Colors.red[900] :深一些的红色，[900]可能代表颜色的深度
        ColorTween(begin: Colors.red, end: Colors.red[900]).animate(animationDemoController);
    
    /*animationDemoController.addListener(() {
      //animationDemoController.value每一帧动画上的值,在0.0 -> 1.0之间
      //print('${animationDemoController.value}');
      setState(() {

      });
    });*/

    //animationDemoController.forward();//开始播放动画
    /*
    监听动画状态：
    AnimationStatus.forward :向前运行
    AnimationStatus.completed :运行完成

    AnimationStatus.reverse :倒退动画
    AnimationStatus.dismissed :倒退完成， 倒退成lowerBound的值
     */
    animationDemoController.addStatusListener((AnimationStatus status) {
      print(status);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        animations: [
          animation,
          animationColor,
        ],
        controller: animationDemoController,
      ),
    );
  }
}


class AnimatedHeart extends AnimatedWidget{
  final List animations;
  final AnimationController controller;

  AnimatedHeart({
    this.animations,
    this.controller,
  }) : super(listenable : controller);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      icon: Icon(Icons.favorite),
      //iconSize: animationDemoController.value,//设置小图标的尺寸
      iconSize: animations[0].value,//设置小图标的尺寸
      color: animations[1].value,
      onPressed: () {
        switch(controller.status){
          case AnimationStatus.completed:
            controller.reverse();//倒退播放动画
            break;
          default:
            controller.forward();
        }
        //animationDemoController.forward();
      },
    );
  }

}




