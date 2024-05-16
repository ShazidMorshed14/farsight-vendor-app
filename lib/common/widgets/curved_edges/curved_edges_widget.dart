import 'package:farsight_vendor_app/common/widgets/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}