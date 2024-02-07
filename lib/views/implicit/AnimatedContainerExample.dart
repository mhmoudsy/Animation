import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double _width = 200;
  double _height = 200;
  double _border = 20;
  Color _color = Colors.yellow;

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
              _width = 200;
              _height = 200;
              _border = 20;
              _color = Colors.yellow;
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
        title: const Text('Animated Container Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _width = 100;
                  _height = 100;
                  _color = Colors.blue;
                  _border = 30;
                });
              },
              child: AnimatedContainer(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(_border),
                ),
                duration: const Duration(milliseconds: 500),
                child: Image.asset('assets/jerry.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
