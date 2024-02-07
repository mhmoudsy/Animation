import 'package:flutter/material.dart';

class IndexedStackTransitionExample extends StatefulWidget {
  const IndexedStackTransitionExample({super.key});

  @override
  State<IndexedStackTransitionExample> createState() =>
      _IndexedStackTransitionExampleState();
}

class _IndexedStackTransitionExampleState
    extends State<IndexedStackTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animationController.forward();
  }

  int currentIndex = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  changeIndex() {
    setState(() {
      currentIndex = currentIndex + 1;
      if (currentIndex == 3) {
        currentIndex = 0;
      }
    });
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
            changeIndex();
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
        title: const Text('Indexed Stack Transition Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          FadeTransition(
            opacity: opacityAnimation,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                color: Colors.blue,
                child: Image.asset('assets/tom.png'),
              ),
            ),
          ),
          ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              color: Colors.blue,
              child: Image.asset('assets/dog.png'),
            ),
          ),
          ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              color: Colors.blue,
              child: Image.asset('assets/jerry.png'),
            ),
          ),
        ],
      ),
    );
  }
}
