import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget flatButtonDemo =  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Button'),
          onPressed: (){},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: (){},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    //有填充的button
    final Widget raisedButtonDemo =  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //RaisedButton默认的填充颜色是主题里的buttonColor
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              /*shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),*/
              shape: StadiumBorder(),
            ),
          ),
          child: RaisedButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey,
            elevation: 0.0,
            color: Theme.of(context).accentColor,//设置按钮的填充颜色
            //按钮的样式可以在按钮里单独设置，也可以在主题里设置
            //textColor: Colors.white,
            //textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(width: 16.0,),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: (){},
          splashColor: Colors.grey,
          elevation: 12.0,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );

    //有边框的按钮
    final Widget outlineButtonDemo =  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //RaisedButton默认的填充颜色是主题里的buttonColor
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              /*shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),*/
              shape: StadiumBorder(),
            ),
          ),
          child: OutlineButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            //color: Theme.of(context).accentColor,//设置按钮的填充颜色
            //按钮的样式可以在按钮里单独设置，也可以在主题里设置
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            //textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(width: 16.0,),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: (){},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );

    //有固定宽度的按钮
    final Widget fixedWidthButton =  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 130.0,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            //color: Theme.of(context).accentColor,//设置按钮的填充颜色
            //按钮的样式可以在按钮里单独设置，也可以在主题里设置
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            //textTheme: ButtonTextTheme.primary,
          ),
        ),
      ],
    );

    //可以按比重展示的按钮
    final Widget expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(//按比例分配控件，flex类似java的weight,flex默认是1
          child: OutlineButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            //color: Theme.of(context).accentColor,//设置按钮的填充颜色
            //按钮的样式可以在按钮里单独设置，也可以在主题里设置
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            //textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(width: 16.0,),
        Expanded(
          flex: 2,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            //color: Theme.of(context).accentColor,//设置按钮的填充颜色
            //按钮的样式可以在按钮里单独设置，也可以在主题里设置
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            //textTheme: ButtonTextTheme.primary,
          ),
        ),
      ],
    );

    //可以添加一组按钮，？？怎么调整按钮的间距
    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
            ),
          ),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                child: Text('Button1'),
                onPressed: (){},
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                //color: Theme.of(context).accentColor,//设置按钮的填充颜色
                //按钮的样式可以在按钮里单独设置，也可以在主题里设置
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
                //textTheme: ButtonTextTheme.primary,
              ),

              OutlineButton(
                child: Text('Button2'),
                onPressed: (){},
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                //color: Theme.of(context).accentColor,//设置按钮的填充颜色
                //按钮的样式可以在按钮里单独设置，也可以在主题里设置
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
                //textTheme: ButtonTextTheme.primary,
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('ButtonDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              flatButtonDemo,
              raisedButtonDemo,
              outlineButtonDemo,
              fixedWidthButton,
              expandedButton,
              buttonBarDemo,
            ],
          ),
        )
    );
  }
}