import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

import 'edge_to_edge_resolver_platform_interface.dart';

/// An implementation of [EdgeToEdgeResolverPlatform] that uses method channels.
class MethodChannelEdgeToEdgeResolver extends EdgeToEdgeResolverPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('edge_to_edge_resolver');


  @override
  Future<void> setNavigationBarColor(int color, bool isDark) async {
    // debugPrint('darkIcons: $isDark');
    if((Platform.isAndroid || Platform.isIOS)){
      await methodChannel.invokeMethod('setNavigationBarColor', {
        'color': color,
        'isDark': isDark,
      });
    }
  }
}
