import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';

class SocialMediaAvatar extends StatelessWidget {
  const SocialMediaAvatar({Key? key, required this.iconPath, required this.onTap}) : super(key: key);

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 2,
          color: const Color(InstaDaleelColors.primaryColor),
        ),
      ),
      child: Center(
        child: Image(
          height: 25,
          width: 25,
          color: const Color(InstaDaleelColors.primaryColor),
          image: AssetImage(
            iconPath,
          ),
        ),
      ),
    );
  }
}
