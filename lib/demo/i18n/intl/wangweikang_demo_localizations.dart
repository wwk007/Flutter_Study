import 'package:intl/intl.dart';

class  WangweikangDemoLocalizations {
  String get titl => Intl.message(
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