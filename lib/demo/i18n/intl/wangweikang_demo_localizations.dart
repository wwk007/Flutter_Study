import 'package:intl/intl.dart';
import 'wangweikang_demomessages_all.dart';
import 'package:flutter/material.dart';

class  WangweikangDemoLocalizations {
  static WangweikangDemoLocalizations of(BuildContext context) {
    return Localizations.of<WangweikangDemoLocalizations>(
        context, WangweikangDemoLocalizations);
  }

  static Future<WangweikangDemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    
    //localeName:本地化代号
    final String localeName = Intl.canonicalizedLocale(name);
    
    return initializeMessages(localeName) .then((bool _) {
      Intl.defaultLocale = localeName;
      return WangweikangDemoLocalizations();
    });
  }

  String get title => Intl.message(
    'hello',
    name: 'title',
    desc: 'demo localizations.',
  );

  String greet(String name) => Intl.message(
    'hello $name',
    name: 'greet',
    desc: 'greet someone.',
    args: [name],//参数
  );
}

class WangweikangDemoLocalizationsDelegate extends
LocalizationsDelegate<WangweikangDemoLocalizations> {
  WangweikangDemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {//判断load加载的资源是否支持本地化的语言，支持返回true
    // TODO: implement isSupported
    return true;
  }

  @override
  Future<WangweikangDemoLocalizations> load(Locale locale) {
    // TODO: implement load
    return WangweikangDemoLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<WangweikangDemoLocalizations> old) {
    //Localizations小部件重构时会调用这个方法，如果返回true，调用load重新加载本地化资源，依赖本地化资源的小部件都会被重建
    // TODO: implement shouldReload
    return false;
  }
}
