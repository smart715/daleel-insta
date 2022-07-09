import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key, required this.title, required this.subTitle, required this.backgroundImagePath, required this.iconPath, required this.onTap}) : super(key: key);

  final String title, subTitle, backgroundImagePath, iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        // height: 165, // it was given
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image(
              fit: BoxFit.contain,
              image: AssetImage(
                backgroundImagePath,
              ),
            ),
            Positioned(
              right: 30,
              top: 10,
              child: SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          subTitle,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: const Color(InstaDaleelColors.primaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Image(
                          height: 15,
                          width: 15,
                          fit: BoxFit.contain,
                          image: AssetImage(
                            iconPath,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
