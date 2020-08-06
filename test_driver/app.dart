//集成测试
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_app/main.dart' as app;//as app :给main.dart起名为app

void main() {

  enableFlutterDriverExtension();

  app.main();
}