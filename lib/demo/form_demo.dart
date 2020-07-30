import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        /*data: ThemeData(//完全替换之前的主题
          primaryColor: Colors.black,
        ),*/
        data: Theme.of(context).copyWith(//替换部分主题设定
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;

  void submitRegisterForm(){
    if(registerFormKey.currentState.validate()){//验证合法性，执行validate属性的方法：validateUsername，validatePassword
      registerFormKey.currentState.save();//保存registerFormKey表单中填写的数据
      debugPrint('username: $username');
      debugPrint('password: $password');

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Registering...'),
        )
      );
    }else{
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validateUsername(value){
    if(value.isEmpty){
      return 'Username is required.';//错误信息，会显示在页面上
    }
    return null;
  }

  String validatePassword(value){
    if(value.isEmpty){
      return 'Password is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: '',
            ),
            onSaved: (value){//value:表单里的数据
              username = value;
            },
            validator: validateUsername,//验证合法性
            autovalidate: autovalidate,//打开自动验证
          ),
          TextFormField(
            obscureText: true,//内容不会直接显示出来,显示黑点
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '',
            ),
            onSaved: (value){//value:表单里的数据
              password = value;
            },
            validator: validatePassword,
            autovalidate: autovalidate,//打开自动验证
          ),
          SizedBox(height: 32.0,),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Register', style: TextStyle(color: Colors.white),),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  //TextEditingController：监听文本变化
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //textEditingController.text = 'hi';
    textEditingController.addListener(() {
      debugPrint('input: ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    //TextField: 获取焦点后，边框颜色为主题中的primarycolor
    return TextField(
      controller: textEditingController,
      /*onChanged: (value){
        debugPrint('input: $value');
      },*/
      onSubmitted: (value){
        debugPrint('submit: $value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter the post title',
        //border: InputBorder.none,//去除底部边框
        //border: OutlineInputBorder(),//文本框四周设置边框
        filled: true,//设置灰色背景
        //fillColor: Colors.red,//设置背景颜色
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Theme.of(context).primaryColor,//使用离小部件最近的主题的primaryColor，没有的话使用main.dart中主题的primaryColor
      color: Theme.of(context).accentColor,
    );
  }
}
