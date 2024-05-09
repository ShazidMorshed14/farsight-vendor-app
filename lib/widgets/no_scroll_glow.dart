import 'package:flutter/material.dart';

class NoScrollGlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class NoScrollGlow extends StatelessWidget {
  const NoScrollGlow({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoScrollGlowBehavior(),
      child: child,
    );
  }
}
