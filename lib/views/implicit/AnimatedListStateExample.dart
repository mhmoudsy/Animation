import 'package:flutter/material.dart';

class AnimatedListStateExample extends StatefulWidget {
  const AnimatedListStateExample({super.key});

  @override
  State<AnimatedListStateExample> createState() =>
      _AnimatedListStateExampleState();
}

class _AnimatedListStateExampleState extends State<AnimatedListStateExample> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<String> list = [];
  void addItem() {
    setState(() {
      list.insert(0, 'New Item ${list.length}');
      listKey.currentState?.insertItem(0);
    });
  }

  void removeItem(int index) {
    setState(() {
      String removedItem = list[index];

      list.removeAt(index);
      listKey.currentState
          ?.removeItem(index, duration: const Duration(milliseconds: 500),
              (BuildContext context, Animation<double> animation) {
        return ListTile(
          title: Text(
            removedItem,
            style: const TextStyle(color: Colors.red),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.animation,
            color: Colors.white,
          ),
          onPressed: () {
            addItem();
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
      body: AnimatedList(
        key: listKey,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: ListTile(
              title: Text(list[index]),
              trailing: IconButton(
                  onPressed: () {
                    removeItem(index);
                  },
                  icon: const Icon(Icons.delete)),
            ),
          );
        },
      ),
    );
  }
}
