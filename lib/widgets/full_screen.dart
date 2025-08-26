// library edge_to_edge_resolver;

import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  final double bottomPadding;
  final Color systemNavigationBarColor;
  final Widget child;
  const FullScreen({super.key, this.bottomPadding = 0.0, required this.child, required this.systemNavigationBarColor});

  @override
  Widget build(BuildContext context) {
    // debugPrint('Navbar height: ${MediaQuery.paddingOf(context).bottom}');
    return Column(
      children: [
        Expanded(child: child),
        Container(
          height:(MediaQuery.paddingOf(context).bottom.clamp(0, 60)) + bottomPadding,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: systemNavigationBarColor,
            border: Border.all(width: 0, color: systemNavigationBarColor)
          ),
        ),
      ],
    );
  }
}
