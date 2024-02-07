import 'package:flutter/material.dart';

class PoistionedTransitionExample extends StatefulWidget {
  const PoistionedTransitionExample({super.key});

  @override
  State<PoistionedTransitionExample> createState() =>
      _PoistionedTransitionExampleState();
}

class _PoistionedTransitionExampleState
    extends State<PoistionedTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<RelativeRect> jerryAnimation;
  late Animation<RelativeRect> tomAnimation;
  late Animation<RelativeRect> spikeAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    jerryAnimation = RelativeRectTween(
            begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
            end: const RelativeRect.fromLTRB(150, 150, 0, 0))
        .animate(animationController);
    tomAnimation = RelativeRectTween(
            begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
            end: const RelativeRect.fromLTRB(60, 60, 0, 0))
        .animate(animationController);
    spikeAnimation = RelativeRectTween(
            begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
            end: const RelativeRect.fromLTRB(10, 10, 0, 0))
        .animate(animationController);
    super.initState();
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
        title: const Text('Poistioned Transition Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          PositionedTransition(
            rect: spikeAnimation,
            child: Container(
              width: 100,
              color: Colors.amber,
              height: 100,
              child: Image.asset('assets/dog.png'),
            ),
          ),
          PositionedTransition(
            rect: tomAnimation,
            child: Container(
              width: 100,
              color: Colors.green,
              height: 100,
              child: Image.asset('assets/tom.png'),
            ),
          ),
          PositionedTransition(
            rect: jerryAnimation,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: Container(
                width: 100,
                color: Colors.brown,
                height: 100,
                child: Image.asset('assets/jerry.png'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    animationController.forward();
              
                  },
                  child: const Icon(Icons.swap_vert),
                ),
                ElevatedButton(
                  onPressed: () {
                    animationController.reverse();
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
