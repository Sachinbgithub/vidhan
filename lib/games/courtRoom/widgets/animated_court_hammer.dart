// widgets/animated_court_hammer.dart
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedCourtHammer extends StatefulWidget {
  final VoidCallback? onAnimationComplete;

  const AnimatedCourtHammer({super.key, this.onAnimationComplete});

  @override
  State<AnimatedCourtHammer> createState() => _AnimatedCourtHammerState();
}

class _AnimatedCourtHammerState extends State<AnimatedCourtHammer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: -0.5,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationComplete?.call();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void playAnimation() {
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotationAnimation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotationAnimation.value * 3.14,
          child: const Icon(
            Icons.gavel,
            size: 48,
            color: Colors.brown,
          ),
        );
      },
    );
  }
}