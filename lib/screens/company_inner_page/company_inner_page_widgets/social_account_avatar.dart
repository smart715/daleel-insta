import 'package:flutter/material.dart';

class SocialAccountAvatar extends StatelessWidget {
  const SocialAccountAvatar({Key? key, required this.iconPath, required this.onTap}) : super(key: key);

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  'assets/images/main_page/home_page/guide_tab/guid_tab_guide_section_circular_avatar_background.png'
              )
          )
      ),
      child: Center(
        child: Image(
          height: 25,
          width: 25,
          image: AssetImage(
              iconPath
          ),
        ),
      ),
    );
  }
}
