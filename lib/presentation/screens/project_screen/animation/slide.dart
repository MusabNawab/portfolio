import 'package:flutter/material.dart';

class SlideAnimation extends StatelessWidget {
  const SlideAnimation(
      {super.key,
      required this.controller,
      required this.widget,
      required this.x});

  final AnimationController controller;
  final Widget widget;
  final double x;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: Tween(begin: Offset(x, 0.0), end: const Offset(0.0, 0.0))
            .animate(
                CurvedAnimation(parent: controller, curve: Curves.elasticOut)),
        child: widget);
  }
}
