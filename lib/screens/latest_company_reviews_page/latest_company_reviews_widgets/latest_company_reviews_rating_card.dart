import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/global_members.dart';

class LatestCompanyReviewsRatingCard extends StatelessWidget {
  const LatestCompanyReviewsRatingCard({Key? key, required this.latestCompanyReviewsRatingCardModel}) : super(key: key);

  final LatestCompanyReviewsRatingCardModel latestCompanyReviewsRatingCardModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin),
            decoration: BoxDecoration(
                color: const Color(InstaDaleelColors.primaryColor),
                borderRadius: BorderRadius.circular(25)
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        latestCompanyReviewsRatingCardModel.title,
                        style: const TextStyle(
                          color: Colors.white,
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
                            latestCompanyReviewsRatingCardModel.description,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      RatingBarIndicator(
                        rating: latestCompanyReviewsRatingCardModel.rating,
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
                      latestCompanyReviewsRatingCardModel.imageAssetPath,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: Visibility(
              visible: latestCompanyReviewsRatingCardModel.badgeVisibility,
              child: const Image(
                height: 25,
                image: AssetImage(
                  'assets/images/main_page/featured_page/carbon_badge.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LatestCompanyReviewsRatingCardModel {
  String title = '';
  String description = '';
  double rating = 0;
  String imageAssetPath = '';
  VoidCallback onTap;
  bool badgeVisibility = true;

  LatestCompanyReviewsRatingCardModel({required this.title, required this.description, required this.rating, required this.imageAssetPath, required this.onTap, this.badgeVisibility = true});
}