import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class TapToExpandIt extends StatefulWidget {
  const TapToExpandIt(
      {super.key,
      this.width,
      this.titlePadding,
      this.paddingCurve,
      this.duration,
      this.closedHeight,
      this.openedHeight,
      this.backgroundcolor,
      this.borderRadius,
      required this.title,
      required this.content,
      this.iconColor,
      this.iconSize,
      this.spaceBetweenBodyTitle,
      this.isScrollable = false,
      this.outerClosedPadding,
      this.outerOpenedPadding});
  final Widget title;
  final Widget content;
  final double? width;
  final double? closedHeight;
  final double? spaceBetweenBodyTitle;
  final double? openedHeight;
  final EdgeInsets? titlePadding;
  final double? outerClosedPadding;
  final double? outerOpenedPadding;
  final Curve? paddingCurve;
  final Duration? duration;
  final Color? backgroundcolor;
  final Color? iconColor;
  final double? iconSize;
  final BorderRadius? borderRadius;
  final bool isScrollable;
  @override
  State<TapToExpandIt> createState() => _TapToExpandItState();
}

class _TapToExpandItState extends State<TapToExpandIt>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> containerAnimation;
  late Animation<double> rotateAnimation;
  late Animation paddingAnimation;
  late Animation<double> fadeAnimation;
  bool isPressed = false;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 500),
    );
    containerAnimation = Tween<double>(
            begin: widget.closedHeight ?? 70, end: widget.openedHeight ?? 250)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        log(status.toString());
      });

    rotateAnimation =
        Tween<double>(begin: 0, end: math.pi).animate(animationController);
    paddingAnimation = Tween<double>(
            begin: widget.outerClosedPadding ?? 20,
            end: widget.outerOpenedPadding ?? 10)
        .animate(CurvedAnimation(
            parent: animationController,
            curve: widget.paddingCurve ?? Curves.bounceInOut));

    fadeAnimation = Tween<double>(begin: 0, end: 20).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.sizeOf(context).width,
      height: widget.isScrollable == true
          ? containerAnimation.value
          : animationController.isAnimating
              ? containerAnimation.value
              : null,
      padding: widget.titlePadding ??
          const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: paddingAnimation.value),
      decoration: BoxDecoration(
        color: widget.backgroundcolor ?? Colors.blue,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
      ),
      child: ListView(
        physics: widget.isScrollable == true
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        shrinkWrap: widget.isScrollable == true ? false : true,
        children: [
          InkWell(
            onTap: () {
              animationController.isCompleted
                  ? animationController.reverse()
                  : animationController.forward();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.title,
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: rotateAnimation.value,
                      child: Icon(
                        Icons.expand_more,
                        color: widget.iconColor ?? Colors.white,
                        size: widget.iconSize ?? 25,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          !animationController.isDismissed
              ? InkWell(
                  onTap: () {
                    animationController.isCompleted
                        ? animationController.reverse()
                        : animationController.forward();
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: widget.spaceBetweenBodyTitle ?? 20,
                      ),
                      FadeTransition(
                          opacity: fadeAnimation, child: widget.content),
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
