import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/global_members.dart';

class OffersTabCard extends StatelessWidget {
  const OffersTabCard({Key? key, required this.offersTabCardModel}) : super(key: key);

  final OffersTabCardModel offersTabCardModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: offersTabCardModel.onTap,
        child: Container(
          height: 110,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin),
          padding: const EdgeInsets.only(left: 10,),
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
                      offersTabCardModel.title,
                      textAlign: TextAlign.end,
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
                          offersTabCardModel.description,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
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
                    offersTabCardModel.imageAssetPath,
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

class OffersTabCardModel {
  String title = '';
  String description = '';
  String imageAssetPath = '';
  VoidCallback onTap;

  OffersTabCardModel({required this.title, required this.description, required this.imageAssetPath, required this.onTap});
}