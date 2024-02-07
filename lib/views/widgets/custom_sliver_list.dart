import 'package:animation_course/views/others/slide_animation.dart';
import 'package:flutter/material.dart';

class CustomSliverList extends StatefulWidget {
  const CustomSliverList({super.key});

  @override
  State<CustomSliverList> createState() => _CustomSliverListState();
}

class _CustomSliverListState extends State<CustomSliverList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SlideAnimation(
            isLeft: index % 2 == 0 ? true : false,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xffe9e9e9),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        );
      },
    );
  }
}
