import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/global_members.dart';

class LatestReviewsRatingCard extends StatelessWidget {
  const LatestReviewsRatingCard({Key? key, required this.title, required this.description, required this.rating, required this.imageAssetPath, required this.onTap,}) : super(key: key);

  final String title;
  final String description;
  final double rating;
  final String imageAssetPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width,
            // margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Row(
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
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Text(
                            description,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: Color(0xFF373737),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      RatingBarIndicator(
                        textDirection: TextDirection.rtl,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        rating: rating,
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
                      imageAssetPath,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 10,
            left: 20,
            child: Image(
              height: 25,
              color: Color(InstaDaleelColors.primaryColor),
              image: AssetImage(
                'assets/images/main_page/featured_page/carbon_badge.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}