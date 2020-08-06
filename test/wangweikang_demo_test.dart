import 'package:flutter/material.dart';
import 'package:flutter_app/demo/test/test_demo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:async';

//测试文件以 _test.dart结尾
//运行所有测试命令：flutter test
/*
0：测试类型：
   a.单元测试
   b.wiget测试
   c.集成测试
1.测试文件以 _test.dart结尾
2.运行所有测试方式：
   a.根目录执行flutter test, 如D:\flutter\Flutter_Study>flutter test、
   b.点击test方法左边的运行按钮

 */
//测试通过显示：All tests passed!
//D:\flutter\Flutter_Study>flutter test
//00:35 +1: All tests passed!
void main() {

  //单元测试
  test('shoule return hello + something.', () {
    var string = WangweikangTestDemo.greet('wangweikang');
    //期望string的值未hello wangweikang ~~，如果一致测试pass，不一致就报错
    /*
    Expected: 'hello wangweikang ~~'
    Actual: 'hello wangweikang'
     */
    expect(string, 'hello wangweikang ~~');
  });
  //wiget测试
  testWidgets('widget testing demo', (WidgetTester tester )  async {
    await tester.pumpWidget(
      MaterialApp(
        home: TestDemo(),
      )
    );

    //find.text('hello'); 查找文本小部件，名字叫hello
    final labelText = find.text('hello');
    //断言：findsNothing 没找到文本小部件hello
    //expect(labelText, findsNothing);
    //断言：找到一个文本小部件hello
    //expect(labelText, findsOneWidget);

    //验证找到的小部件的数量
    expect(labelText, findsNWidgets(1));

    //找到文本里包含0的文本小部件
    final actionChipLableText = find.text('0');
    expect(actionChipLableText, findsOneWidget);

    final actionChip = find.byType(ActionChip);
    await tester.tap(actionChip);//点击小部件
    await tester.pump();//重建小部件

    final actionChipLableTextAfterTap = find.text('1');
    expect(actionChipLableTextAfterTap, findsOneWidget);
    expect(actionChipLableText, findsNothing);
  });
}