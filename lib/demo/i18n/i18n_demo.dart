import 'package:flutter/material.dart';
//import 'package:flutter_app/demo/i18n/map/wangweikang_demo_localizations_demo.dart';
import 'intl/wangweikang_demo_localizations.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);//获取当前使用的语言

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Text('${locale.languageCode}'),
            Text(locale.toString()),
            Text(
              //Localizations.of(context, WangweikangDemoLocalizations).title,
               // WangweikangDemoLocalizations.of(context).title,
                WangweikangDemoLocalizations.of(context).greet('wangweikang'),
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}

