import 'package:flutter/material.dart';

class AnimatedPositionedDirectionalExample extends StatefulWidget {
  const AnimatedPositionedDirectionalExample({super.key});

  @override
  State<AnimatedPositionedDirectionalExample> createState() =>
      _AnimatedPositionedDirectionalExampleState();
}

class _AnimatedPositionedDirectionalExampleState
    extends State<AnimatedPositionedDirectionalExample> {
  double top = 0;
  double start = 0;
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
        title: const Text('Animated Positioned Directional Example',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              AnimatedPositionedDirectional(
                top: top,
                start: start,
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/jerry.png'),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            start -= 50;
                            if (start > MediaQuery.of(context).size.width) {
                              start = MediaQuery.of(context).size.width;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.turn_slight_left_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            top += 50;
                            if (top > MediaQuery.of(context).size.height) {
                              top = MediaQuery.of(context).size.height;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_downward_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            top -= 50;
                            if (top > MediaQuery.of(context).size.height) {
                              top = MediaQuery.of(context).size.height;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.vertical_align_top_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            start += 50;
                            if (start >
                                MediaQuery.of(context).size.width - 150) {
                              start = MediaQuery.of(context).size.width - 150;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_right_alt_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
