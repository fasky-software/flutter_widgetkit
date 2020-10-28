import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgetkit/flutter_widgetkit.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_widgetkit');

  TestWidgetsFlutterBinding.ensureInitialized();
  
  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
