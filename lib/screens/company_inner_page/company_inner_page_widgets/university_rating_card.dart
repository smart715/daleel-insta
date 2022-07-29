import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:insta_daleel/constants/colors.dart';

import '../../../global_members.dart';

class UniversityRatingCard extends StatelessWidget {
  const UniversityRatingCard({Key? key, required this.universityRatingCardModel}) : super(key: key);

  final UniversityRatingCardModel universityRatingCardModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: universityRatingCardModel.onTap,
      child: Container(
          margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin, top: 15, bottom: 10),
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 120,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      height: 100,
                      width: 45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.badge_outlined),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),

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
                            style: const TextStyle(
                                color: Color(InstaDaleelColors.primaryColor),
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

                    Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 0, left: 6),
                      child: Image(
                        height: 90,
                        width: 90,
                        fit: BoxFit.contain,
                        image: AssetImage(
                            universityRatingCardModel.imagePath,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Text(
                      universityRatingCardModel.description,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: Colors.black, fontSize: 13),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}


class UniversityRatingCardModel {
  String title, subtitle, description, imagePath;
  VoidCallback onTap, badgeTap, heartTap;
  double rating;

  UniversityRatingCardModel({required this.title, required this.subtitle, required this.description, required this.rating,
      required this.imagePath, required this.onTap, required this.badgeTap, required this.heartTap});
}
