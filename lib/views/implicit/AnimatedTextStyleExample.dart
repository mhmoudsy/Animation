import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedTextStyleExample extends StatefulWidget {
  const AnimatedTextStyleExample({super.key});

  @override
  State<AnimatedTextStyleExample> createState() =>
      _AnimatedTextStyleExampleState();
}

class _AnimatedTextStyleExampleState extends State<AnimatedTextStyleExample> {
  double _size = 20;
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.animation,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _size = 20;
              _color = Colors.black;
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
        title: const Text('Animated TextStyle Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              style: TextStyle(color: _color, fontSize: _size),
              curve: Curves.bounceIn,
              duration: const Duration(milliseconds: 400),
              child: const Text(
                'Animated Default TextStyle',
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _size += 5;
                        _color = Color.fromARGB(
                          math.Random().nextInt(255),
                          math.Random().nextInt(255),
                          math.Random().nextInt(255),
                          math.Random().nextInt(255),
                        );
                      });
                    },
                    icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (_size != 0) {
                          _size -= 2;
                          _color = Color.fromARGB(
                            math.Random().nextInt(255),
                            math.Random().nextInt(255),
                            math.Random().nextInt(255),
                            1,
                          );
                        }
                      });
                    },
                    icon: const Icon(Icons.remove)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
