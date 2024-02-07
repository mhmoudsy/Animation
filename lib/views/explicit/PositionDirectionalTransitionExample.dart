import 'package:flutter/material.dart';

class PositionDirectionalTransitionExample extends StatefulWidget {
  const PositionDirectionalTransitionExample({super.key});

  @override
  State<PositionDirectionalTransitionExample> createState() =>
      _PositionDirectionalTransitionExampleState();
}

class _PositionDirectionalTransitionExampleState
    extends State<PositionDirectionalTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<RelativeRect> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = RelativeRectTween(
            begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
            end: const RelativeRect.fromLTRB(150, 150, 0, 0))
        .animate(animationController);
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
        title: const Text('Position Directional Transition Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return PositionedDirectional(
                bottom: animation.value.bottom,
                top: animation.value.top,
                start: animation.value.left,
                end: animation.value.right,
                child: Container(
                  height: MediaQuery.sizeOf(context).height,
                  color: Colors.amber,
                  child: Image.asset('assets/dog.png'),
                ),
              );
            },
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
