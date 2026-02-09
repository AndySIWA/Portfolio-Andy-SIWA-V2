import 'package:flutter/material.dart';
import 'package:gamestore/pages/home/widgets/newest.dart';
import 'package:gamestore/pages/home/widgets/popular.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key});

  final categories = [
    {
      'title': "Arcade",
      'icon': Icons.track_changes_outlined,
      'color': Color(0xFF605CF4),
    },
    {
      'title': "Racing",
      'icon': Icons.sports_motorsports_outlined,
      'color': Color(0xFFFC77A6),
    },
    {
      'title': "Strategy",
      'icon': Icons.casino_outlined,
      'color': Color(0xFF4391FF),
    },
    {
      'title': "More",
      'icon': Icons.sports_esports,
      'color': Color(0xFF7182F2),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 140,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 25),
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => Column(
                    children: [
                      SizedBox(height: 25),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: categories[index]['color'] as Color,
                        ),
                        child: Icon(
                          categories[index]['icon'] as IconData,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        categories[index]['title'] as String,
                        style: TextStyle(
                          color: Colors.black.withAlpha(180),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  )),
              separatorBuilder: ((context, index) => SizedBox(width: 33)),
              itemCount: categories.length,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Jeux populaires',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          PopularGame(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Jeux récents',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          NewestGame(),
        ],
      ),
    );
  }
}
