import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../constants/colors.dart';

class CommunityPostCard extends StatelessWidget {
  const CommunityPostCard({
    Key? key,
    this.onTap,
    required this.personName,
    required this.personProfilePicLink,
    required this.postText,
    required this.likesCount,
    required this.commentsCount,
    this.isLiked = false,
    required this.customerId,
    this.showImage = false,
    this.imageUrl = '',
  }) : super(key: key);

  final bool showImage;
  final String personName, personProfilePicLink, postText, imageUrl;
  final int likesCount, commentsCount, customerId;
  // final IconData likesIconData;
  final bool isLiked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    bool shouldShowImage =
        (showImage == true && imageUrl.isNotEmpty && imageUrl.contains('http'));
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
          height: 140 + (shouldShowImage ? 200 : 0),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          margin: const EdgeInsets.only(
            bottom: 3,
            left: 4,
            right: 4,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                blurRadius: 22,
                offset: Offset(3, 3),
                color: Color.fromARGB(30, 177, 177, 177),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: isLiked
                                    ? Image.asset(
                                        'assets/images/comment/2.png',
                                        height: 21,
                                      )
                                    : Image.asset(
                                        'assets/images/comment/1.png',
                                        height: 21,
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
                            Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: Image.asset(
                                'assets/images/comment/3.png',
                                height: 21,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            width: 120,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Text(
                                personName,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  color: Color(InstaDaleelColors.primaryColor),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 20,
                                  offset: Offset(10, 10),
                                  color: Color.fromRGBO(41, 39, 130, 0.15),
                                )
                              ],
                              border: Border.all(
                                color: const Color.fromRGBO(255, 255, 255, 0.2),
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  personProfilePicLink,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          postText,
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (shouldShowImage)
                const SizedBox(
                  height: 4,
                ),
              if (shouldShowImage)
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
            ],
          )),
    );
  }
}
