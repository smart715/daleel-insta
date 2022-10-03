import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../global_members.dart';

class CommunityTabLargeCard extends StatelessWidget {
  const CommunityTabLargeCard({Key? key, required this.personName, required this.personProfilePicLink, required this.postText, required this.postFirstPicLink, required this.likesCount, required this.commentsCount, required this.customerId, required this.likesIconData, this.onTap,}) : super(key: key);

  final String personName, personProfilePicLink, postText, postFirstPicLink;
  final int likesCount, commentsCount, customerId;
  final IconData likesIconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin, top: 15,bottom: 5),
        height: 350,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 60,
              child: Row(
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
                            Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: Icon(
                                likesIconData,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              likesCount.toString(),
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
                          const Padding(
                            padding: EdgeInsets.only(right: 3),
                            child: Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            commentsCount.toString(),
                            style: const TextStyle(
                              color: Color(0xFFB1B1B1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Text(
                                  personName,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    color: Color(InstaDaleelColors.primaryColor),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
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
                                image: CachedNetworkImageProvider(personProfilePicLink),
                                fit: BoxFit.contain,
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
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    postText,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: const TextStyle(
                        color: Colors.black, fontSize: 13),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(postFirstPicLink),
                  fit: BoxFit.contain,
                )
              ),
            )
          ],
        ));
  }
}