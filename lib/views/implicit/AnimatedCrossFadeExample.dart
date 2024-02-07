import 'package:flutter/material.dart';

class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});

  @override
  State<AnimatedCrossFadeExample> createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool isFirstImage = true;
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
        child: GestureDetector(
          child: AnimatedCrossFade(
            firstCurve: Curves.decelerate,
            firstChild: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(18)),
              child: Image.asset('assets/dog.png'),
            ),
            secondChild: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(18)),
              child: Image.asset('assets/jerry.png'),
            ),
            crossFadeState: isFirstImage
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 700),
          ),
          onTap: () {
            setState(() {
              isFirstImage = !isFirstImage;
            });
          },
        ),
      ),
    );
  }
}
