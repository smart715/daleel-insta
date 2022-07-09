import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';

class IntroSliderDot extends StatelessWidget {
   const IntroSliderDot({Key? key, this.color = const Color(InstaDaleelColors.introSliderDotInActiveColor)}) : super(key: key);

   final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: color,
      ),
    );
  }
}
