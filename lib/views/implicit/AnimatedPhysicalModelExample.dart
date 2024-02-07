import 'package:flutter/material.dart';

class AnimatedPhysicalModelExample extends StatefulWidget {
  const AnimatedPhysicalModelExample({super.key});

  @override
  State<AnimatedPhysicalModelExample> createState() =>
      _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState
    extends State<AnimatedPhysicalModelExample> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(
            isPressed ? Icons.download : Icons.upload,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isPressed = !isPressed;
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
        title: const Text('Animated Physical Model Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: AnimatedPhysicalModel(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          shadowColor: Colors.amber,
          duration: const Duration(milliseconds: 500),
          elevation: isPressed ? 50 : 2,
          shape: BoxShape.rectangle,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: 150,
            height: 150,
            decoration: const BoxDecoration(),
            child: Image.asset('assets/tom.png'),
          ),
        ),
      ),
    );
  }
}
