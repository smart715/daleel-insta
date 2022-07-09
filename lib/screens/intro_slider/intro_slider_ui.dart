import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/screens/intro_slider/intro_slider_behavior.dart';
import 'package:insta_daleel/screens/sign_in/sign_in_ui.dart';
import 'package:insta_daleel/widgets/intro_slider_dot.dart';
import 'package:insta_daleel/widgets/intro_slider_tile.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> with IntroSliderBehavior{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 95,
                fit: FlexFit.tight,
                child: PageView.builder(
                  onPageChanged: (int value) {
                    setState ((){
                      pageIndex = value;
                    });
                  },
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => IntroSliderTile(introSliderModel: introSliderModelList[index]),
                ),
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IntroSliderDot(color: Color(pageIndex == 0 ? InstaDaleelColors.primaryColor : InstaDaleelColors.introSliderDotInActiveColor)),
                    IntroSliderDot(color: Color(pageIndex == 1 ? InstaDaleelColors.primaryColor : InstaDaleelColors.introSliderDotInActiveColor)),
                    IntroSliderDot(color: Color(pageIndex == 2 ? InstaDaleelColors.primaryColor : InstaDaleelColors.introSliderDotInActiveColor)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: pageIndex == 2 ? true : false,
        child: IconButton(
          icon: const Icon(Icons.arrow_forward_outlined, color: Color(InstaDaleelColors.primaryColor)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn(),));
          },
        ),
      ),
    );
  }
}


