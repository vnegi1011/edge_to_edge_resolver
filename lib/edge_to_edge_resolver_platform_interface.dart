import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'edge_to_edge_resolver_method_channel.dart';

abstract class EdgeToEdgeResolverPlatform extends PlatformInterface {
  /// Constructs a EdgeToEdgeResolverPlatform.
  EdgeToEdgeResolverPlatform() : super(token: _token);

  static final Object _token = Object();

  static EdgeToEdgeResolverPlatform _instance =
      MethodChannelEdgeToEdgeResolver();

  /// The default instance of [EdgeToEdgeResolverPlatform] to use.
  ///
  /// Defaults to [MethodChannelEdgeToEdgeResolver].
  static EdgeToEdgeResolverPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EdgeToEdgeResolverPlatform] when
  /// they register themselves.
  static set instance(EdgeToEdgeResolverPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> setNavigationBarColor(int color, bool bool);
}
