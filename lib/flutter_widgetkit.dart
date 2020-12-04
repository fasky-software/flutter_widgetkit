
import 'dart:async';

import 'package:flutter/services.dart';

class WidgetKit {
  static const MethodChannel _channel =
      const MethodChannel('flutter_widgetkit');

  // static Future<String> get platformVersion async {
  //   final String version = await _channel.invokeMethod('getPlatformVersion');
  //   return version;
  // }

  static void reloadAllTimelines() async {
    await _channel.invokeMethod('reloadAllTimelines');
  }

  static void reloadTimelines(String ofKind) async {
    await _channel.invokeMethod('reloadTimelines', <String, dynamic>{'ofKind': ofKind});
  }

  static dynamic getItem(String key, String appGroup) async {
    return await _channel.invokeMethod('getItem', <String, dynamic>{'key': key, 'appGroup': appGroup});
  }

  static dynamic setItem(String key, dynamic value, String appGroup) async {
    return await _channel.invokeMethod('setItem', <String, dynamic>{'key': key, 'value': value, 'appGroup': appGroup});
  }

  static Future<bool> removeItem(String key, String appGroup) async {
    return await _channel.invokeMethod('removeItem', <String, dynamic>{'key': key, 'appGroup': appGroup});
  }
}
