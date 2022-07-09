import 'package:insta_daleel/models/intro_slider_model.dart';

mixin IntroSliderBehavior {
  int pageIndex = 0;
  List<IntroSliderModel> introSliderModelList = [
    IntroSliderModel(imageAssetPath: 'assets/images/intro_sliders/slider_image_one.png',),
    IntroSliderModel(imageAssetPath: 'assets/images/intro_sliders/slider_image_two.png',),
    IntroSliderModel(imageAssetPath: 'assets/images/intro_sliders/slider_image_three.png',),
  ];
}