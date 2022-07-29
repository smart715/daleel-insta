import 'package:flutter/material.dart';

class GuideTabGuideSectionCircularAvatar extends StatelessWidget {
  const GuideTabGuideSectionCircularAvatar({Key? key, required this.iconAssetPath, required this.description, required this.onTap}) : super(key: key);

  final String iconAssetPath, description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/main_page/home_page/guide_tab/guid_tab_guide_section_circular_avatar_background.png',
                )
              )
            ),
            child: Center(
              child: Image(
                height: 30,
                width: 30,
                image: AssetImage(
                  iconAssetPath,
                ),
              ),
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
