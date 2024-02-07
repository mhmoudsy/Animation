import 'package:animation_course/views/others/tap_it.dart';

import 'package:flutter/material.dart';

class ProductAnimationExample extends StatefulWidget {
  const ProductAnimationExample({super.key});

  @override
  State<ProductAnimationExample> createState() =>
      _ProductAnimationExampleState();
}

class _ProductAnimationExampleState extends State<ProductAnimationExample> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xffd8d8d8),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TapToExpandIt(
              title: Text('Tap'),
              content: Text(
                  'Lorem ipsum dolor sit amet consectetur. Ut mattis ullamcorper risus tincidunt eget ac. Vivamus sit suspendisse integer donec maecenas euismod erat risus at. Libero maecenas varius donec nisi tempus. Est risus urna nullam nulla orci arcu sit pellentesque. Et senectus viverra gravida faucibus sagittis facilisis ultrices faucibus. Eu proin viverra imperdiet ultrices ut dictum nisi at vitae. Nulla sollicitudin nisi adipiscing nec. Lectus et nulla lorem gravida eu lacus venenatis purus proin. Aliquet faucibus id est at sed consectetur velit tempor. Consectetur sapien varius neque consequat gravida erat vel sed ultrices. In sagittis adipiscing vestibulum tellus fusce eu quam eu nulla. Commodo morbi nec rhoncus adipiscing sed urna ullamcorper in. Arcu tortor at lacus nunc lorem arcu. Mi tellus sem et sem ipsum laoreet volutpat.'),
            ),
          ],
        ),
      ),
    );
  }
}
