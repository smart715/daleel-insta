import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/global_members.dart';

class GuideTabRatingCard extends StatelessWidget {
  const GuideTabRatingCard({Key? key, required this.guideTabRatingCardModel}) : super(key: key);

  final GuideTabRatingCardModel guideTabRatingCardModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 110,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin),
        decoration: BoxDecoration(
          color: const Color(InstaDaleelColors.primaryColor),
          borderRadius: BorderRadius.circular(25)
        ),
        /*decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/main_page/home_page/guide_tab/rating_card_background.png',
            ),
          ),
        ),*/
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    guideTabRatingCardModel.title,
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
                        guideTabRatingCardModel.description,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  RatingBarIndicator(
                    rating: guideTabRatingCardModel.rating,
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
                    guideTabRatingCardModel.imageAssetPath,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GuideTabRatingCardModel {
  String title = '';
  String description = '';
  double rating = 0;
  String imageAssetPath = '';
  VoidCallback onTap;

  GuideTabRatingCardModel({required this.title, required this.description, required this.rating, required this.imageAssetPath, required this.onTap});
}