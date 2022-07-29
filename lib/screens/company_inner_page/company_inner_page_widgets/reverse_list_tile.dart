import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../global_members.dart';

class CompanyInnerPageReverseListTile extends StatelessWidget {
  const CompanyInnerPageReverseListTile({Key? key, required this.title, required this.subTitle, required this.iconPath, required this.onTap}) : super(key: key);

  final String title, subTitle, iconPath;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(top: 10),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(InstaDaleelColors.primaryColor),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Text(
                      subTitle,
                        style: const TextStyle(
                          color: Color(InstaDaleelColors.primaryColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: leftRightGlobalMargin - 5),
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/main_page/home_page/guide_tab/guid_tab_guide_section_circular_avatar_background.png'
                          )
                      )
                  ),
                  child: Center(
                    child: Image(
                      height: 30,
                      width: 30,
                      image: AssetImage(
                        iconPath
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
