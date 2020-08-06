import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'dart:async';

/*
void main() {
  group('App', () {
    FlutterDriver driver;

    final actionChip = find.byValueKey('actionChip');
    final actionChipLabelText = find.byValueKey('actionChipLabelText');

    setUpAll( () async{//运行方法前要做的事情
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if(driver != null){
        driver.close();
      }
    });


    test('starts at 0', () async{
      expect(await driver.getText(actionChipLabelText), '0');
    });
    
    test('increments the counter', () async{
      await driver.tap(actionChip);

      expect(await driver.getText(actionChipLabelText), '1');
    });
  });
}*/
