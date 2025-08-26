import Flutter
import UIKit

public class EdgeToEdgeResolverPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "edge_to_edge_resolver", binaryMessenger: registrar.messenger())
    let instance = EdgeToEdgeResolverPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "setNavigationBarColor":
        guard let args = call.arguments as? [String: Any],
              let colorValue = args["color"] as? Int else {
            result(FlutterError(code: "BAD_ARGS", message: "Missing arguments", details: nil))
            return
        }

        // Convert ARGB int to UIColor
        let alpha = CGFloat((colorValue >> 24) & 0xFF) / 255.0
        let red = CGFloat((colorValue >> 16) & 0xFF) / 255.0
        let green = CGFloat((colorValue >> 8) & 0xFF) / 255.0
        let blue = CGFloat(colorValue & 0xFF) / 255.0
        let uiColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)

        // Apply color to app window and navigation bar if exists
        if let window = UIApplication.shared.windows.first {
            window.backgroundColor = uiColor

            if let isDark = args["isDark"] as? Bool {
                // If you want dark icons (like black indicator), force Light mode
                // If you want light icons (like white indicator), force Dark mode
                window.overrideUserInterfaceStyle = isDark ? .light : .dark
            }
        }

        result(nil)

    default:
        result(FlutterMethodNotImplemented)
    }
  }

}
