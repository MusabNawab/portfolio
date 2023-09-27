import 'package:flutter/material.dart';

class FadeAnimate extends StatelessWidget {
  const FadeAnimate(
      {super.key, required this.animationController, required this.widget});

  final AnimationController animationController;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity:
          CurvedAnimation(parent: animationController, curve: Curves.easeIn),
      child: widget,
    );
  }
}
