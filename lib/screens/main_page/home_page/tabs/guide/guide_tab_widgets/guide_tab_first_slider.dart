import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import '../../../../../../global_members.dart';
import '../../../../../../widgets/intro_slider_dot.dart';

class GuideTabFirstSlider extends StatefulWidget {
  const GuideTabFirstSlider({Key? key, required this.guideTabFirstSliderModelList}) : super(key: key);

  final List<GuideTabFirstSliderModel> guideTabFirstSliderModelList;

  @override
  State<GuideTabFirstSlider> createState() => _GuideTabFirstSliderState();
}

class _GuideTabFirstSliderState extends State<GuideTabFirstSlider> {
  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
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
                  Image(
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                    image: AssetImage(
                        widget.guideTabFirstSliderModelList[index].imageAssetPath,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.guideTabFirstSliderModelList[index].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        // onTap: widget.guideTabFirstSliderModelList[index].onTap,
                        onTap: () {
                          Navigator.pushNamed(context, 'ShoppingMalls');
                        },
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: const Center(
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                  color: Color(InstaDaleelColors.primaryColor),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
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

class GuideTabFirstSliderModel {
  GuideTabFirstSliderModel({
    required this.description,
    required this.imageAssetPath,
    required this.onTap,
  });

  String description = '';
  String imageAssetPath = '';
  VoidCallback onTap;

}
