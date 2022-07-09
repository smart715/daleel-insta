import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';

class GuideTabVisitsCountSection extends StatelessWidget {
  const GuideTabVisitsCountSection({Key? key, required this.peopleVisitsCount}) : super(key: key);

  final int peopleVisitsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$peopleVisitsCount Visits',
          style: const TextStyle(
            color: Color(InstaDaleelColors.primaryColor),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 15),
          child: Container(
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
            child: const Center(
              child: Image(
                height: 30,
                width: 30,
                image: AssetImage(
                  'assets/images/main_page/home_page/guide_tab/query_stats_icon.png',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
