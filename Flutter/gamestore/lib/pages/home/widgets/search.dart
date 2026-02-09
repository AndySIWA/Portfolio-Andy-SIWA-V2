import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Stack(
        children: [
          TextField(
            cursorColor: Color.fromARGB(255, 42, 139, 166),
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                ),
                contentPadding: EdgeInsets.all(20),
                prefixIcon: Icon(
                  Icons.search_outlined,
                  size: 30,
                  color: Colors.black.withAlpha(160),
                ),
                hintText: "Chercher un jeu",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.withAlpha(200),
                )),
          ),
          Positioned(
              right: 12,
              bottom: 10,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Icon(
                  Icons.mic_outlined,
                  size: 25,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
