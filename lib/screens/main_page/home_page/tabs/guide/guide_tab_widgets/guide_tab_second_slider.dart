import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:insta_daleel/constants/colors.dart';
import '../../../../../../widgets/intro_slider_dot.dart';

class GuideTabSecondSlider extends StatefulWidget {
  const GuideTabSecondSlider(
      {Key? key, required this.guideTabSecondSliderModelList})
      : super(key: key);

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
            height: 155,
            child: PageView.builder(
              onPageChanged: (int value) {
                setState(() {
                  sliderIndex = value;
                });
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 155,
                    margin: const EdgeInsets.only(bottom: 6, right: 3, left: 3),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(34, 168, 243, 1),
                          offset: Offset(2.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/guide_page/2_bkg.jpg',
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 30),
                          child: Image(
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                            image: AssetImage(
                              widget.guideTabSecondSliderModelList[index]
                                  .imageAssetPath,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    widget.guideTabSecondSliderModelList[index]
                                        .title,
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 2,
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width - 190,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width - 180,
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Text(
                                      widget
                                          .guideTabSecondSliderModelList[index]
                                          .description,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.5,
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
                ),
              ),
            ),
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
