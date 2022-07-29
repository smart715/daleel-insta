import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../global_members.dart';

class CommunityTabSmallCard extends StatelessWidget {
  const CommunityTabSmallCard({Key? key, required this.communityTabSmallCardModel}) : super(key: key);

  final CommunityTabSmallCardModel communityTabSmallCardModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: communityTabSmallCardModel.onTap,
      child: Container(
          margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin, top: 15,bottom: 5),
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
                              onTap: communityTabSmallCardModel.favouritiesIconOnTap,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: Icon(
                                  communityTabSmallCardModel.favoritiesIcon,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Text(
                              communityTabSmallCardModel
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
                            onTap: communityTabSmallCardModel.messageIconOnTap,
                            child: const Padding(
                              padding: EdgeInsets.only(right: 3),
                              child: Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Text(
                            communityTabSmallCardModel.messageCount.toString(),
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
                            communityTabSmallCardModel.personName,
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
                            image: DecorationImage(
                              image: AssetImage(
                                  communityTabSmallCardModel.personProfilePicPath),
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
                    communityTabSmallCardModel
                        .description,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        color: Colors.black, fontSize: 13),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
class CommunityTabSmallCardModel {
  CommunityTabSmallCardModel({
    required this.personName,
    required this.personProfilePicPath,
    required this.description,
    required this.favouritiesCount,
    required this.messageCount,
    required this.favoritiesIcon,
    required this.onTap,
    required this.favouritiesIconOnTap,
    required this.messageIconOnTap,
  });

  String personName;
  String personProfilePicPath;
  String description;
  int favouritiesCount;
  int messageCount;
  IconData favoritiesIcon;
  VoidCallback onTap;
  VoidCallback favouritiesIconOnTap;
  VoidCallback messageIconOnTap;
}