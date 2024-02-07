import 'package:flutter/material.dart';

class AnimatedPositionExample extends StatefulWidget {
  const AnimatedPositionExample({super.key});

  @override
  State<AnimatedPositionExample> createState() =>
      _AnimatedPositionExampleState();
}

class _AnimatedPositionExampleState extends State<AnimatedPositionExample> {
  bool isPositioned = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(
            isPositioned ? Icons.adjust : Icons.animation,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isPositioned = !isPositioned;
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
        title: const Text('Animated Positioned Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/cheese.png'),
                ),
              ),
              AnimatedPositioned(
                left:
                    isPositioned ? 0 : MediaQuery.of(context).size.width - 100,
                duration: const Duration(seconds: 1),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/jerry.png'),
                ),
              ),
              AnimatedPositioned(
                left: isPositioned ? 0 : 80,
                top: isPositioned ? 0 : 300,
                duration: const Duration(seconds: 1),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/tom.png'),
                ),
              ),
              AnimatedPositioned(
                top:
                    isPositioned ? 0 : MediaQuery.of(context).size.height - 250,
                duration: const Duration(seconds: 1),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/dog.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
