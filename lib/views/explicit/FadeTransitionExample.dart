import 'package:flutter/material.dart';

class FadeTransitionExample extends StatefulWidget {
  const FadeTransitionExample({super.key});

  @override
  State<FadeTransitionExample> createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<FadeTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    animation = Tween<double>(begin: 0, end: 5).animate(animationController);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void startAnimation() {
    animationController.reset();
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.upload,
            color: Colors.white,
          ),
          onPressed: () {
            startAnimation();
          }),
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
        child: FadeTransition(
          opacity: animation,
          child: Container(
            width: 100,
            color: Colors.amber,
            height: 100,
            child: Image.asset('assets/jerry.png'),
          ),
        ),
      ),
    );
  }
}
