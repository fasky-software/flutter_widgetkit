#import "FlutterWidgetkitPlugin.h"
#if __has_include(<flutter_widgetkit/flutter_widgetkit-Swift.h>)
#import <flutter_widgetkit/flutter_widgetkit-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_widgetkit-Swift.h"
#endif

@implementation FlutterWidgetkitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterWidgetkitPlugin registerWithRegistrar:registrar];
}
@end
