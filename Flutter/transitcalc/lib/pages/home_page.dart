import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/courses.svg",
            height: 100,
          ),
          Image.asset("assets/images/saas.png"),
          Text(
            "TransitCalc",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 42,
            ),
          ),
          Text(
            "Calculateur de frais de transit de produits",
            style: TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
        ],
      ),
    );
  }
}
