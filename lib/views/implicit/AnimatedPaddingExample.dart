import 'package:flutter/material.dart';

class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  bool isExpand = false;
  double paddingValue = 10.0;
  List character = ['tom', 'jerry', 'dog', 'cheese'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(
            isExpand ? Icons.expand_circle_down_outlined : Icons.expand,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isExpand = !isExpand;
              paddingValue = isExpand ? 30.0 : 10.0;
            });
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
        title: const Text(
          'Animated Padding Example',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          character.length,
          (index) => AnimatedPadding(
            curve: Curves.elasticIn,
            padding: EdgeInsets.all(paddingValue),
            duration: const Duration(milliseconds: 700),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.amber,
              child: Image.asset('assets/${character[index]}.png'),
            ),
          ),
        ),
      ),
    );
  }
}
