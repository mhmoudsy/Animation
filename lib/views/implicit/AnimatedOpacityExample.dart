import 'package:flutter/material.dart';

class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({super.key});

  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  bool isSeen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(
            !isSeen ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isSeen = !isSeen;
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
        title: const Text('Animated Opacity Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(milliseconds: !isSeen ? 700 : 3500),
              curve: Curves.easeIn,
              opacity: isSeen ? 1.0 : 0.0,
              child: const Text(
                'Tom And Jerry',
                style: TextStyle(fontSize: 33),
              ),
            ),
            AnimatedOpacity(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 1500),
              opacity: isSeen ? 1.0 : 0.0,
              child: Image.asset(
                'assets/tom.png',
                height: 150,
                width: 100,
              ),
            ),
            AnimatedOpacity(
              curve: Curves.easeIn,
              duration: Duration(milliseconds: !isSeen ? 3500 : 700),
              opacity: isSeen ? 1.0 : 0.0,
              child: Image.asset(
                'assets/jerry.png',
                height: 150,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
