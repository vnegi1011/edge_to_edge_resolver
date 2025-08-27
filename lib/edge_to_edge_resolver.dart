import 'edge_to_edge_resolver_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:edge_to_edge_resolver/utils/helper.dart';

class EdgeToEdgeResolver {
  static Color navigationBarColor = Colors.black45;
  static Future<void> setNavigationBarColor({required Color color}) async {
    navigationBarColor = color;
    return EdgeToEdgeResolverPlatform.instance.setNavigationBarColor(
      color.toARGB32(),
      color.computeLuminance() < 0.5,
    );
  }
}

class EdgeToEdgeResolverWidget extends StatelessWidget {
  final double bottomPadding;
  final Color? systemNavigationBarColor;
  final Widget child;
  const EdgeToEdgeResolverWidget({
    super.key,
    this.bottomPadding = 0.0,
    required this.child,
    this.systemNavigationBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return FullScreen(
      bottomPadding: bottomPadding,
      systemNavigationBarColor:
          systemNavigationBarColor ?? EdgeToEdgeResolver.navigationBarColor,
      child: child,
    );
  }
}
