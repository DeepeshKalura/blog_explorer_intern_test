import 'package:flutter/material.dart';

class AnimatedHeart extends StatefulWidget {
  final bool isLiked;

  const AnimatedHeart({super.key, required this.isLiked});

  @override
  AnimatedHeartState createState() => AnimatedHeartState();
}

class AnimatedHeartState extends State<AnimatedHeart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _sizeAnimation = Tween<double>(
      begin: 30.0,
      end: 50.0,
    ).animate(_animationController);

    _colorAnimation = ColorTween(
      begin: Colors.grey[300],
      end: Colors.red,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLiked) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Icon(
          Icons.favorite,
          color: _colorAnimation.value,
          size: _sizeAnimation.value,
        );
      },
    );
  }
}
