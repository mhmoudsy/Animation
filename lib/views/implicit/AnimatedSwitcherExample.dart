import 'package:flutter/material.dart';

class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({super.key});

  @override
  State<AnimatedSwitcherExample> createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  bool isLoading = false;
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
        title: const Text('Animated Switcher Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: AnimatedSwitcher(
          switchInCurve: Curves.fastEaseInToSlowEaseOut,
          duration: const Duration(seconds: 1),
          child: !isLoading
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLoading = !isLoading;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "Button",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      isLoading = !isLoading;
                    });
                  },
                  child: const CircularProgressIndicator()),
        ),
      ),
    );
  }
}
