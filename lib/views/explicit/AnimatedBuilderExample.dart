import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
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
        title: const Text('Animated Physical Model Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: Center(
          child: AnimatedBuilder(
              animation: animationController,
              builder: (context, Widget? child) {
                return Transform.rotate(
                  angle: math.pi * animationController.value * 2,
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset('assets/dog.png'),
                  ),
                );
              })),
    );
  }
}
