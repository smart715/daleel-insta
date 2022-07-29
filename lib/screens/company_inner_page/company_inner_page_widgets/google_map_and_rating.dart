import 'package:flutter/material.dart';
import 'package:insta_daleel/global_members.dart';

import '../../../constants/colors.dart';

class GoogleMapAndRating extends StatelessWidget {
  const GoogleMapAndRating({Key? key, required this.ratingText1, required this.ratingText2}) : super(key: key);

  final String ratingText1, ratingText2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 160,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: leftRightGlobalMargin),
              child: const Image(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/comapny_inner_page/map.png',
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: const Center(
                child: Image(
                  height: 25,
                  width: 25,
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/comapny_inner_page/fluent_arrow_turn_right.png',
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          right: 30,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Container(
              height: 30,
              width: 65,
              decoration: BoxDecoration(
                  color: const Color(InstaDaleelColors.primaryColor),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Center(
                  child: Text(
                    '@77527',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 70,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 30,
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xFFFFCE31),
                  ),
                  Text(
                    ' $ratingText1   ($ratingText2+ ratings)',
                    style: const TextStyle(
                        color: Color(InstaDaleelColors.primaryColor)
                    ),
                  ),
                ],
              ),
            )
        ),
      ],
    );
  }
}
