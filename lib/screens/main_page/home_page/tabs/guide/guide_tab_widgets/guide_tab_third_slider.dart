import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import '../../../../../../global_members.dart';
import '../../../../../../widgets/intro_slider_dot.dart';

class GuideTabThirdSlider extends StatefulWidget {
  const GuideTabThirdSlider(
      {Key? key, required this.guideTabThirdSliderModelList})
      : super(key: key);

  final List<GuideTabThirdSliderModel> guideTabThirdSliderModelList;

  @override
  State<GuideTabThirdSlider> createState() => _GuideTabThirdSlider();
}

class _GuideTabThirdSlider extends State<GuideTabThirdSlider> {
  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            onPageChanged: (int value) {
              setState(() {
                sliderIndex = value;
              });
            },
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Center(
              child: GestureDetector(
                onTap: widget.guideTabThirdSliderModelList[index].onTap,
                child: Container(
                    margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: widget.guideTabThirdSliderModelList[index].favouritiesIconOnTap,
                                        child: const Padding(
                                          padding: EdgeInsets.only(right: 3),
                                          child: Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        widget.guideTabThirdSliderModelList[index]
                                            .favouritiesCount
                                            .toString(),
                                        style: const TextStyle(
                                          color: Color(0xFFB1B1B1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: widget.guideTabThirdSliderModelList[index].messageIconOnTap,
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 3),
                                        child: Icon(
                                          Icons.chat_bubble_outline,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.guideTabThirdSliderModelList[index].messageCount.toString(),
                                      style: const TextStyle(
                                        color: Color(0xFFB1B1B1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Text(
                                      widget
                                          .guideTabThirdSliderModelList[index].personName,
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        color: Color(InstaDaleelColors.primaryColor),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                      ),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/main_page/home_page/guide_tab/dp_to_delete_two.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 20),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Text(
                              widget.guideTabThirdSliderModelList[index]
                                  .description,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13),
                            ),
                          ),
                        ),
                      ],
                    )),
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

class GuideTabThirdSliderModel {
  GuideTabThirdSliderModel({
    required this.personName,
    required this.description,
    required this.favouritiesCount,
    required this.messageCount,
    required this.onTap,
    required this.favouritiesIconOnTap,
    required this.messageIconOnTap,
  });

  String personName;
  String description;
  int favouritiesCount;
  int messageCount;
  VoidCallback onTap;
  VoidCallback favouritiesIconOnTap;
  VoidCallback messageIconOnTap;
}
