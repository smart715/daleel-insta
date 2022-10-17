import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/screens/company/company_widgets/company_card_display.dart';
import '../../../../../../widgets/intro_slider_dot.dart';

class GuideTabRatingCardSlider extends StatefulWidget {
  const GuideTabRatingCardSlider(
      {Key? key, required this.guideTabRatingCardSliderModelList})
      : super(key: key);

  final List<GuideTabRatingCardSliderModel> guideTabRatingCardSliderModelList;

  @override
  State<GuideTabRatingCardSlider> createState() => _GuideTabRatingCardSlider();
}

class _GuideTabRatingCardSlider extends State<GuideTabRatingCardSlider> {
  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 105,
          child: PageView.builder(
            onPageChanged: (int value) {
              setState(() {
                sliderIndex = value;
              });
            },
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final c = widget.guideTabRatingCardSliderModelList[index];
              return CompanyDisplayCard(
                title: c.title,
                description: c.description,
                image: c.imageAssetPath,
                rating: c.rating,
              );
            },
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IntroSliderDot(
                  color: Color(sliderIndex == 0
                      ? InstaDaleelColors.primaryColor
                      : InstaDaleelColors.introSliderDotInActiveColor)),
              IntroSliderDot(
                  color: Color(sliderIndex == 1
                      ? InstaDaleelColors.primaryColor
                      : InstaDaleelColors.introSliderDotInActiveColor)),
              IntroSliderDot(
                  color: Color(sliderIndex == 2
                      ? InstaDaleelColors.primaryColor
                      : InstaDaleelColors.introSliderDotInActiveColor)),
            ],
          ),
        ),
      ],
    );
  }
}

class GuideTabRatingCardSliderModel {
  String title = '';
  String description = '';
  double rating = 0;
  String imageAssetPath = '';
  VoidCallback onTap;

  GuideTabRatingCardSliderModel(
      {required this.title,
      required this.description,
      required this.rating,
      required this.imageAssetPath,
      required this.onTap});
}
