import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/screens/company_inner_page/company_inner_page_ui.dart';
import '../../../../../../global_members.dart';
import '../../../../../../widgets/intro_slider_dot.dart';

class GuideTabSecondSlider extends StatefulWidget {
  const GuideTabSecondSlider({Key? key, required this.guideTabSecondSliderModelList}) : super(key: key);

  final List<GuideTabSecondSliderModel> guideTabSecondSliderModelList;

  @override
  State<GuideTabSecondSlider> createState() => _GuideTabSecondSlider();
}

class _GuideTabSecondSlider extends State<GuideTabSecondSlider> {
  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          // onTap: widget.guideTabSecondSliderModelList[sliderIndex].onTap,
          onTap: () {
            Navigator.pushNamed(context, 'CompanyInnerPage');
          },
          child: SizedBox(
            height: 200,
            child: PageView.builder(
              onPageChanged: (int value) {
                setState ((){
                  sliderIndex = value;
                });
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin),
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(InstaDaleelColors.primaryColor),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 30),
                      child: Image(
                        width: 120,
                        height: 120,
                        fit: BoxFit.fill,
                        image: AssetImage(
                          widget.guideTabSecondSliderModelList[index].imageAssetPath,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              widget.guideTabSecondSliderModelList[index].title,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 2,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width - 190,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          height: 100,
                          width: MediaQuery.of(context).size.width - 180,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Text(
                              widget.guideTabSecondSliderModelList[index].description,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IntroSliderDot(color: Color(sliderIndex == 0 ? InstaDaleelColors.primaryColor : InstaDaleelColors.introSliderDotInActiveColor)),
              IntroSliderDot(color: Color(sliderIndex == 1 ? InstaDaleelColors.primaryColor : InstaDaleelColors.introSliderDotInActiveColor)),
              IntroSliderDot(color: Color(sliderIndex == 2 ? InstaDaleelColors.primaryColor : InstaDaleelColors.introSliderDotInActiveColor)),
            ],
          ),
        ),
      ],
    );
  }
}

class GuideTabSecondSliderModel {
  GuideTabSecondSliderModel({
    required this.title,
    required this.description,
    required this.imageAssetPath,
    required this.onTap,
  });

  String title;
  String description;
  String imageAssetPath;
  VoidCallback onTap;

}
