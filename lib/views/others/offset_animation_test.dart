import 'package:flutter/material.dart';

class OffsetTestScrren extends StatefulWidget {
  const OffsetTestScrren({super.key});

  @override
  State<OffsetTestScrren> createState() => _OffsetTestScrrenState();
}

class _OffsetTestScrrenState extends State<OffsetTestScrren>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
        title: const Text('Offset Animation Test Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: animation,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.black,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
