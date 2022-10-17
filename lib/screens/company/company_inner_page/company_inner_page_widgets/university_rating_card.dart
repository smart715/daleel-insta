import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:insta_daleel/constants/colors.dart';

class UniversityRatingCard extends StatelessWidget {
  const UniversityRatingCard(
      {Key? key, required this.universityRatingCardModel})
      : super(key: key);

  final UniversityRatingCardModel universityRatingCardModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: universityRatingCardModel.onTap,
      child: Container(
        height: 170,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (true)
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/main_page/bottom_navigation_bar/badge.png',
                        height: 25,
                        color: const Color.fromRGBO(255, 206, 49, 1),
                      )
                    ],
                  ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              universityRatingCardModel.title,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                color: Color(InstaDaleelColors.primaryColor),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              universityRatingCardModel.subtitle,
                              textAlign: TextAlign.end,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Color(InstaDaleelColors.primaryColor),
                                fontSize: 12,
                              ),
                            ),
                            RatingBarIndicator(
                              rating: universityRatingCardModel.rating,
                              textDirection: TextDirection.rtl,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 25.0,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 70,
                        height: 67,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(74, 74, 74, 0.44),
                              offset: Offset(2.0, 1.0),
                              blurRadius: 6.0,
                            ),
                          ],
                          image: DecorationImage(
                            image:
                                AssetImage(universityRatingCardModel.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              universityRatingCardModel.description,
              textAlign: TextAlign.end,
              maxLines: 3,
              style: const TextStyle(
                color: Color.fromRGBO(74, 74, 74, 1),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UniversityRatingCardModel {
  String title, subtitle, description, imagePath;
  VoidCallback onTap, badgeTap, heartTap;
  double rating;

  UniversityRatingCardModel(
      {required this.title,
      required this.subtitle,
      required this.description,
      required this.rating,
      required this.imagePath,
      required this.onTap,
      required this.badgeTap,
      required this.heartTap});
}
