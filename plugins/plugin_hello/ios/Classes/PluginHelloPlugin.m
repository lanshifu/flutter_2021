#import "PluginHelloPlugin.h"
#if __has_include(<plugin_hello/plugin_hello-Swift.h>)
#import <plugin_hello/plugin_hello-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "plugin_hello-Swift.h"
#endif

@implementation PluginHelloPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPluginHelloPlugin registerWithRegistrar:registrar];
}
@end
