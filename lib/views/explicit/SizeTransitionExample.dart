import 'package:flutter/material.dart';

class SizeTransitionExample extends StatefulWidget {
  const SizeTransitionExample({super.key});

  @override
  State<SizeTransitionExample> createState() => _SizeTransitionExampleState();
}

class _SizeTransitionExampleState extends State<SizeTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.bounceInOut),
    );
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
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
        title: const Text('Size Transition Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            animationController.reset();
            animationController.forward();
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Center(
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                  child: Image.asset('assets/cheese.png'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
