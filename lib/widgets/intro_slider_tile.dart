import 'package:flutter/material.dart';
import 'package:insta_daleel/models/intro_slider_model.dart';

import '../constants/colors.dart';

class IntroSliderTile extends StatelessWidget {
  const IntroSliderTile({Key? key, required this.introSliderModel}) : super(key: key);

  final IntroSliderModel introSliderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 20,
          fit: FlexFit.tight,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: LayoutBuilder(
              builder: (context, constraints) => Text(
                introSliderModel.mainText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PoppinsMedium',
                  fontWeight: FontWeight.bold,
                  fontSize: constraints.maxHeight * 0.35,
                  // fontFamily: 'Poppins',
                  color: const Color(InstaDaleelColors.primaryColor),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 50,
          fit: FlexFit.tight,
          child:  Image(
            fit: BoxFit.contain,
            image: AssetImage(introSliderModel.imageAssetPath),
          ),
        ),
        Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: LayoutBuilder(
            builder: (context, constraints) => Text(
              introSliderModel.subText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'PoppinsRegular',
                fontWeight: FontWeight.bold,
                fontSize: constraints.maxHeight * 0.85,
                // fontFamily: 'Poppins',
                color: const Color(InstaDaleelColors.primaryColor),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 20,
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              introSliderModel.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
