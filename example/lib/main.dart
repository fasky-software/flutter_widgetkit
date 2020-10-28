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
          title: const Text('Plugin example app'),
        ),
        body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter a text',
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextField(
                controller: textController
              )),
            RaisedButton(onPressed: () {
              WidgetKit.setItem('widgetData', jsonEncode(FlutterWidgetData(textController.text)), 'group.com.fasky');
              WidgetKit.reloadAllTimelines();
            }, child: Text("Send to Widget"))
          ],
        ),
        ),
      ),
    );
  }
}