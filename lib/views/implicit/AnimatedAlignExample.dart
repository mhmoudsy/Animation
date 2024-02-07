import 'package:flutter/material.dart';

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  int _jerryAlignd = 1;
  int _tomAlignd = 1;
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
              _jerryAlignd += 1;
              _tomAlignd += 1;
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
        title: const Text('Animated Align Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _jerryAlignd += 1;
              });
            },
            child: AnimatedAlign(
              alignment: jerryMovement(_jerryAlignd),
              duration: const Duration(milliseconds: 200),
              child: Image.asset(
                'assets/jerry.png',
                width: 100,
                height: 100,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _tomAlignd += 1;
              });
            },
            child: AnimatedAlign(
              alignment: tomMovement(_tomAlignd + 1),
              duration: const Duration(milliseconds: 200),
              child: Image.asset(
                'assets/tom.png',
                width: 100,
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Alignment jerryMovement(int align) {
    switch (align) {
      case 1:
        return Alignment.topLeft;
      case 2:
        return Alignment.bottomLeft;
      case 3:
        return Alignment.topRight;
      case 4:
        return Alignment.centerRight;
      case 5:
        return Alignment.center;
      case 6:
        return Alignment.centerLeft;
      case 7:
        return Alignment.topCenter;
      case 8:
        return Alignment.topCenter;
      case 9:
        return Alignment.bottomCenter;

      default:
        _jerryAlignd = 0;
        return Alignment.topLeft;
    }
  }

  Alignment tomMovement(int align) {
    switch (align) {
      case 1:
        return Alignment.topLeft;
      case 2:
        return Alignment.bottomLeft;
      case 3:
        return Alignment.topRight;
      case 4:
        return Alignment.centerRight;
      case 5:
        return Alignment.center;
      case 6:
        return Alignment.centerLeft;
      case 7:
        return Alignment.topCenter;
      case 8:
        return Alignment.topCenter;
      case 9:
        return Alignment.bottomCenter;

      default:
        _tomAlignd = 0;
        return Alignment.topLeft;
    }
  }
}
