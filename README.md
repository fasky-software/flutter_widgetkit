<h1 align="center"> flutter_widgetkit </h1>

<p align="center">
    <img alt="flutter" src="./git_assets/flutter.png" width="96">
    <img alt="widgetkit" src="./git_assets/widgetkit.png" width="96">
</p>

<div align="center">
  <strong><a href="https://flutter.dev/">Flutter</a> Library for the iOS 🍏 <a href="https://developer.apple.com/documentation/widgetkit/">WidgetKit framework</a> and Widget Communication</strong> 
</div>
<br>
<div align="center">
<img alt="widget_small"  src="./git_assets/focused_small.png" width="96">
<img alt="widget_medium"  src="./git_assets/weather_medium.png" width="200">
<img alt="widget_small"  src="./git_assets/notes_small.png" width="96">
</div>
<br>

## Table of Contents 📚

- [Introduction 👨‍🏫](##introduction-👨‍🏫)
- [Installation 🖇‍](##installation-🖇‍)
- [Usage 👨🏻‍💻](##usage-👨🏻‍💻)
- [Methods 📖](##methods-📖‍)
- [Contributors 🤓](##contributors-🤓)
- [License 🔖](##license-🔖)

## Introduction 👨‍🏫

This library allows you to call essential methods from the iOS "WidgetKit Framework", which are needed when developing a widget. For example updating the widget timelines. It is also possible to communicate with the widget via <a href="https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_security_application-groups">App Groups</a>/<a href="https://developer.apple.com/documentation/foundation/userdefaults">UserDefaults</a>.

🚨 To be on the safe side: This library exposes API functionality of <a href="https://developer.apple.com/documentation/widgetkit/">WidgetKit</a>. The widgets themselves must be developed natively in SwiftUI.

### <strong>ℹ️ <a href="https://thomas-leiter.medium.com/develop-an-ios-14-widget-in-flutter-with-swiftui-e98eaff2c606">Blog</a> about writing a Widget with this library</strong>

## Installation 🖇‍

Add flutter_widgetkit as a <a href="https://flutter.dev/docs/development/packages-and-plugins/using-packages">dependency in your pubspec.yaml</a> file.

## Usage 👨🏻‍💻

```dart
import 'package:flutter_widgetkit/flutter_widgetkit.dart';

// Reloading Widget Timelines
WidgetKit.reloadAllTimelines();
WidgetKit.reloadTimelines('test');

// Communicate with Widget
WidgetKit.setItem('testString', 'Hello World', 'group.com.fasky');
```

## Methods 📖‍

#### `WidgetKit.reloadAllTimelines()`

Reloads the timelines for all configured widgets belonging to the containing app.

---

#### `WidgetKit.reloadTimelines(ofKind: String)`

Reloads the timelines for all widgets of a particular kind.

---

#### `WidgetKit.setItem(String key, dynamic value, String appGroup)`

Writes Key-Value to <a href="https://developer.apple.com/documentation/foundation/userdefaults">UserDefaults</a> database.

---

#### `WidgetKit.getItem(String key, String appGroup)`

Reads Value from <a href="https://developer.apple.com/documentation/foundation/userdefaults">UserDefaults</a> database.

---

## [Contributors 🤓](#Contributors)

| [<img alt="Thomas Leiter" src="https://avatars3.githubusercontent.com/u/20393156?s=400&u=ae0a43de5d81d58a698abffe4e2ede024f2b6700&v=4" width="117">](https://github.com/tomLadder) |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <p align="center">[Thomas Leiter](https://github.com/tomLadder) </p>                                                                                                               |

## License 🔖

MIT License

Copyright (c) 2020 Thomas Leiter, Fasky OG

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
