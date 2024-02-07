import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedLoadingButton extends StatefulWidget {
  const AnimatedLoadingButton({super.key});

  @override
  State<AnimatedLoadingButton> createState() => _AnimatedLoadingButtonState();
}

class _AnimatedLoadingButtonState extends State<AnimatedLoadingButton>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController animationController2;
  late Animation<double> animation;
  late Animation<double> animationBounce;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation =
        Tween<double>(begin: 120.0, end: 50.0).animate(animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            print(status);
          });
    animationBounce = Tween<double>(begin: 30, end: 50).animate(
        CurvedAnimation(parent: animationController2, curve: Curves.bounceOut))
      ..addListener(() {
        setState(() {});
      });
  }

  bool isPressed = false;

  doSomething() async {
    Timer(const Duration(seconds: 4), () {
      setState(() {
        if (animationController.isCompleted) {
          animationController2.forward();
          isPressed = true;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    animationController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.blue,
        title: const Text('Animated Loading Button Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            animationController.forward();
            doSomething();
            print(animation.value);
          },
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Container(
                width: animationController2.isDismissed
                    ? animation.value
                    : animationBounce.value,
                height: !animationController2.isDismissed
                    ? animationBounce.value
                    : 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: !animationController.isDismissed
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: !animationController2.isDismissed
                              ? const Icon(Icons.check, color: Colors.white)
                              : const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                        ),
                      )
                    : const Center(
                        child: Text('Press me',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
