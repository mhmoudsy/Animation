import 'package:animation_course/views/others/slide_animation.dart';
import 'package:flutter/material.dart';

class CustomSliverGrid extends StatefulWidget {
  const CustomSliverGrid({super.key});

  @override
  State<CustomSliverGrid> createState() => _CustomSliverGridState();
}

class _CustomSliverGridState extends State<CustomSliverGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 15),
        itemCount: 4,
        itemBuilder: (context, index) {
          return SlideAnimation(
            isLeft: index % 2 == 0 ? true : false,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(
                  0xffb1b1b1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        });
  }
}
