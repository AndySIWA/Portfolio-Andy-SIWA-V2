import 'package:flutter/material.dart';
import 'package:gamestore/pages/home/widgets/category.dart';
import 'package:gamestore/pages/home/widgets/header.dart';
import 'package:gamestore/pages/home/widgets/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 87, 161, 182),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Transform(
              transform: Matrix4.identity()..rotateZ(20),
              origin: Offset(150, 50),
              child: Image.asset(
                'assets/images/bg_liquid.png',
                width: 200,
              )),
          Positioned(
            right: 0,
            top: 200,
            child: Transform(
                transform: Matrix4.identity()..rotateZ(20),
                origin: Offset(180, 100),
                child: Image.asset(
                  'assets/images/bg_liquid.png',
                  width: 200,
                )),
          ),
          Column(
            children: [
              HeaderSection(),
              SearchSection(),
              CategorySection(),
            ],
          ),
        ],
      )),
      bottomNavigationBar: NavigationBar(),
    );
  }
}

Widget NavigationBar() {
  return Container(
    color: const Color.fromARGB(255, 42, 139, 166),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromARGB(255, 42, 139, 166),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          unselectedItemColor: Colors.grey.withAlpha(200),
          items: [
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(
                Icons.home_rounded,
                size: 50,
              ),
            ),
            BottomNavigationBarItem(
              label: "Application",
              icon: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(50),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.more_horiz_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Film",
              icon: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(50),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Book",
              icon: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(50),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.auto_stories_rounded,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
            ),
          ]),
    ),
  );
}
