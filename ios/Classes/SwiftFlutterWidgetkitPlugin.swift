import Flutter
import UIKit
import WidgetKit

public class SwiftFlutterWidgetkitPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_widgetkit", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterWidgetkitPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == "reloadAllTimelines") {
      if #available(iOS 14.0, *) {
        WidgetCenter.shared.reloadAllTimelines()
      }
      result(nil);
      return;
    } else if(call.method == "reloadTimelines") {
      if #available(iOS 14.0, *) {
        if let args = call.arguments as? [String: Any],
         let ofKind = args["ofKind"] as? String {
          WidgetCenter.shared.reloadTimelines(ofKind: ofKind)
        }
      }

      result(nil);
      return;
    } else if(call.method == "getItem") {
       if let args = call.arguments as? [String: Any],
         let appGroup = args["appGroup"] as? String,
         let key = args["key"] as? String {
        
        var sharedDefaults: UserDefaults? = nil;
        
        if(appGroup != "") {
            sharedDefaults = UserDefaults.init(suiteName: appGroup)
        }
        
        if(sharedDefaults == nil) {
            // TODO: Throw Exception
            result(nil)
            return
        }
        
        let value = sharedDefaults?.value(forKey: key)
        
        result(value)
        return
      }

       result(nil);
       return;
    } else if(call.method == "setItem") {
       if let args = call.arguments as? [String: Any],
         let appGroup = args["appGroup"] as? String,
         let key = args["key"] as? String,
         let value = args["value"] as? Any {
        
        var sharedDefaults: UserDefaults? = nil;
        
        if(appGroup != "") {
            sharedDefaults = UserDefaults.init(suiteName: appGroup)
        }
        
        if(sharedDefaults == nil) {
            result(nil)
            return
        }
        
        sharedDefaults?.setValue(value, forKey: key)
        
        result(value)
        return
      }

       result(nil);
       return;
    }

    result(FlutterMethodNotImplemented);
  }
}
