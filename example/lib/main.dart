import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_widgetkit/flutter_widgetkit.dart';
import 'package:flutter_widgetkit_example/FlutterWidgetData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    WidgetKit.reloadAllTimelines();
    WidgetKit.reloadTimelines('test');

    final data = FlutterWidgetData('Hello From Flutter');
    final resultString = await WidgetKit.getItem('testString', 'group.com.fasky');
    final resultBool = await WidgetKit.getItem('testBool', 'group.com.fasky');
    final resultNumber = await WidgetKit.getItem('testNumber', 'group.com.fasky');
    final resultJsonString = await WidgetKit.getItem('testJson', 'group.com.fasky');

    var resultData;
    if(resultJsonString != null) {
      resultData = FlutterWidgetData.fromJson(jsonDecode(resultJsonString));
    }

    WidgetKit.setItem('testString', 'Hello World', 'group.com.fasky');
    WidgetKit.setItem('testBool', false, 'group.com.fasky');
    WidgetKit.setItem('testNumber', 10, 'group.com.fasky');
    WidgetKit.setItem('testJson', jsonEncode(data), 'group.com.fasky');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('iOS Widget Showcase'),
        ),
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter a text 🙏🏻',
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextField(
                controller: textController
              )),
            RaisedButton(onPressed: () {
              WidgetKit.setItem('widgetData', jsonEncode(FlutterWidgetData(textController.text)), 'group.com.fasky');
              WidgetKit.reloadAllTimelines();
            }, child: Text('Update Widget 🥳')),
            RaisedButton(onPressed: () {
              WidgetKit.removeItem('widgetData', 'group.com.fasky');
              WidgetKit.reloadAllTimelines();
            }, child: Text('Remove Widget Data ⚠️'))
          ],
        ),
        ),
      ),
    );
  }
}
