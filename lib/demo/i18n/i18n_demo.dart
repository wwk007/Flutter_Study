import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}

