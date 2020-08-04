import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';


class WangweikangDemoLocalizations {
  final Locale locale;

  WangweikangDemoLocalizations(this.locale);

  static WangweikangDemoLocalizations of(BuildContext context) {
    return Localizations.of<WangweikangDemoLocalizations>(
        context, WangweikangDemoLocalizations);
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
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
    return SynchronousFuture<WangweikangDemoLocalizations> (
        WangweikangDemoLocalizations(locale)
    );
  }

  @override
  bool shouldReload(LocalizationsDelegate<WangweikangDemoLocalizations> old) {
    //Localizations小部件重构时会调用这个方法，如果返回true，调用load重新加载本地化资源，依赖本地化资源的小部件都会被重建
    // TODO: implement shouldReload
    return false;
  }
}

