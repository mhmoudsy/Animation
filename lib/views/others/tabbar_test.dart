import 'package:flutter/material.dart';

class TabBarTest extends StatefulWidget {
  const TabBarTest({super.key});

  @override
  State<TabBarTest> createState() => _TabBarTestState();
}

class _TabBarTestState extends State<TabBarTest>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> special = [
    {"id": 7, "Specialization_name": "test1"},
    {"id": 8, "Specialization_name": "test2"},
    {"id": 9, "Specialization_name": "test3"},
    {"id": 10, "Specialization_name": "test4"},
  ];
  List<Map<String, dynamic>> content = [
    {
      "name": "Mahmoud",
      "email": "Mahmoud@gmail.com",
      "image": "www.google.com",
      "latitude": "30.2",
      "longitude": "220.5",
      "specialization_id": 7,
      "id": 1
    },
    {
      "name": "ibrahem",
      "email": "ibrahem@gmail.com",
      "image": "www.google.com",
      "latitude": "30.2",
      "longitude": "220.5",
      "specialization_id": 7,
      "id": 1
    },
    {
      "name": "Ahmed",
      "email": "ahmed@gmail.com",
      "image": "www.google.com",
      "latitude": "30.2",
      "longitude": "220.5",
      "specialization_id": 9,
      "id": 1
    },
  ];
  late TabController tapBarController;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    tapBarController = TabController(
        length: special.length, vsync: this, initialIndex: selectedIndex);
  }

  @override
  void dispose() {
    tapBarController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              controller: tapBarController,
              dividerColor: Colors.transparent,
              enableFeedback: true,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.focused)
                    ? null
                    : Colors.transparent;
              }),
              indicatorColor: Colors.transparent,
              splashBorderRadius: BorderRadius.circular(20),
              tabs: List.generate(
                special.length,
                (index) => Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: index == selectedIndex ? Colors.blue : Colors.white,
                  ),
                  child: Text(
                    special[index]['Specialization_name'],
                    style: TextStyle(
                        color: index == selectedIndex
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: tapBarController,
                children: special.map(
                  (specialization) {
                    var filteredContent = content
                        .where((item) =>
                            item['specialization_id'] == specialization['id'])
                        .toList();

                    return ListView.builder(
                        itemCount: filteredContent.length,
                        itemBuilder: (context, index) {
                          var item = filteredContent[index];

                          return ListTile(
                            title: Text(item['name'].toString()),
                            subtitle: Text(item['email'].toString()),
                            // Add other fields as needed
                          );
                        });
                  },
                ).toList(),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  List x = special.map((e) {
                    return content
                        .where((element) =>
                            element['specialization_id'] == e['id'])
                        .toList();
                  }).toList();
                  print(x);
                },
                child: const Text("Test"))
          ],
        ),
      ),
    );
  }
}
