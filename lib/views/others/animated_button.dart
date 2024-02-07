import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedButton extends StatefulWidget {
  const AnimatedButton(
      {super.key,
      this.width,
      this.height,
      this.iconSize,
      this.backgroundColor,
      this.iconColor, this.duration});
  final double? width;
  final double? height;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final Duration? duration;
  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation =
        Tween<double>(begin: 0, end: math.pi).animate(animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            print(status);
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: InkWell(
            onHighlightChanged: (value) {
              setState(() {
                isTap = value;
                print(value);
              });
            },
            onTap: () {
              animationController.isCompleted
                  ? animationController.reverse()
                  : animationController.forward();
            },
            child: AnimatedContainer(
                width: isTap ? 45 : widget.width ?? 50,
                height: isTap ? 45 : widget.height ?? 50,
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: widget.backgroundColor ?? Colors.white),
                duration:widget.duration?? const Duration(milliseconds: 300),
                child: AnimatedBuilder(
                    animation: animationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.rotate(
                        angle: animation.value,
                        child:  Icon(
                          color: widget.iconColor??Colors.black,
                          Icons.expand_more,
                          size:widget.iconSize?? 30,
                        ),
                      );
                    })),
          ),
        ),
      ],
    );
  }
}
