import 'package:flutter/material.dart';

class DefaultTextStyleTransitionExample extends StatefulWidget {
  const DefaultTextStyleTransitionExample({super.key});

  @override
  State<DefaultTextStyleTransitionExample> createState() =>
      _DefaultTextStyleTransitionExampleState();
}

class _DefaultTextStyleTransitionExampleState
    extends State<DefaultTextStyleTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<TextStyle> animation;
  TextStyle textStyle1 = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 19, color: Colors.indigo);
  TextStyle textStyle2 = const TextStyle(
      fontWeight: FontWeight.w500, fontSize: 25, color: Colors.lime);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    animation = TextStyleTween(begin: textStyle1, end: textStyle2)
        .animate(animationController);
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
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultTextStyleTransition(
              style: animation,
              child: const Text(
                'Hello World',
              ),
            ),
            const SizedBox(height: 30,),
            Row(
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
          ],
        ),
      ),
    );
  }
}
