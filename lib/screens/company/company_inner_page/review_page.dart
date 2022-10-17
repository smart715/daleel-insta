import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/screens/company/company_inner_page/company_inner_page_widgets/reviews_and_rating_card.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({
    Key? key,
    this.isFeatured = false,
    required this.title,
    required this.image,
    required this.description,
    required this.rating,
  }) : super(key: key);

  final bool isFeatured;
  final String title;
  final String description;
  final String image;
  final double rating;
  static const String reviewPageRoute = 'ReviewPage';

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      body: Column(
        children: [
          SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(InstaDaleelColors.primaryColor),
                ),
              ),
              title: const Center(
                child: Text(
                  'Latest Reviews',
                  style: TextStyle(
                      color: Color(InstaDaleelColors.primaryColor),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              trailing: SizedBox(
                width: 70,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // InkWell(
                    //   onTap: () {},
                    //   borderRadius: BorderRadius.circular(15),
                    //   child: const Image(
                    //     height: 25,
                    //     width: 25,
                    //     fit: BoxFit.fill,
                    //     image: AssetImage(
                    //         'assets/images/main_page/app_bar/main_screen_appbar_notification_icon.png'),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        height: 25,
                        width: 25,
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/images/main_page/app_bar/main_screen_appbar_help_info_icon.png'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 95,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(4, 4),
                          blurRadius: 9,
                          color: Color.fromRGBO(0, 0, 0, 0.03),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.isFeatured)
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 15),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/main_page/bottom_navigation_bar/badge.png',
                                    height: 20,
                                    color: const Color(
                                        InstaDaleelColors.primaryColor),
                                  )
                                ],
                              ),
                            ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        widget.title,
                                        style: const TextStyle(
                                          color: Color(
                                              InstaDaleelColors.primaryColor),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            widget
                                                .description, //'lorem ipsum dilomakad aiqerjlk ah adflqjpwieru adakj pqeirj  akdnbvak;df ;qp pqwieurpu a dfj;qpeir',
                                            textAlign: TextAlign.end,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  55, 55, 55, 0.6),
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      RatingBarIndicator(
                                        rating: widget.rating,
                                        textDirection: TextDirection.rtl,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 18.0,
                                        direction: Axis.horizontal,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 59,
                                  height: 57,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromRGBO(74, 74, 74, 0.44),
                                        offset: Offset(2.0, 1.0),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                    image: (widget.image.contains('http'))
                                        ? DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                widget.image),
                                            fit: BoxFit.cover,
                                          )
                                        : DecorationImage(
                                            image: AssetImage(widget.image),
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
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // Divider
                  const Divider(
                    color: Colors.white,
                    height: 30,
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        // 'Reviews/Ratings' card section
                        ReviewAndRatingCard(
                          onTap: () {},
                          title: 'Mr . Salim Abdullah',
                          date: '05 : 19 pm',
                          time: '2022/06/19',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                          imagePath:
                              'assets/images/comapny_inner_page/review_and_rating_image1.png',
                          rating: 5,
                        ),
                        ReviewAndRatingCard(
                          onTap: () {},
                          title: 'Mr. Alif Iftekhar',
                          date: '05 : 19 pm',
                          time: '2022/06/19',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                          imagePath:
                              'assets/images/comapny_inner_page/review_and_rating_image2.png',
                          rating: 5,
                        ),
                        ReviewAndRatingCard(
                          onTap: () {},
                          title: 'Mr . Salim Abdullah',
                          date: '05 : 19 pm',
                          time: '2022/06/19',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                          imagePath:
                              'assets/images/comapny_inner_page/review_and_rating_image1.png',
                          rating: 5,
                        ),
                        ReviewAndRatingCard(
                          onTap: () {},
                          title: 'Mr . Salim Abdullah',
                          date: '05 : 19 pm',
                          time: '2022/06/19',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                          imagePath:
                              'assets/images/comapny_inner_page/review_and_rating_image1.png',
                          rating: 5,
                        ),
                        ReviewAndRatingCard(
                          onTap: () {},
                          title: 'Mr. Alif Iftekhar',
                          date: '05 : 19 pm',
                          time: '2022/06/19',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                          imagePath:
                              'assets/images/comapny_inner_page/review_and_rating_image2.png',
                          rating: 5,
                        ),
                        ReviewAndRatingCard(
                          onTap: () {},
                          title: 'Mr . Salim Abdullah',
                          date: '05 : 19 pm',
                          time: '2022/06/19',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                          imagePath:
                              'assets/images/comapny_inner_page/review_and_rating_image1.png',
                          rating: 5,
                        ),
                        ReviewAndRatingCard(
                          onTap: () {},
                          title: 'Mr . Salim Abdullah',
                          date: '05 : 19 pm',
                          time: '2022/06/19',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                          imagePath:
                              'assets/images/comapny_inner_page/review_and_rating_image1.png',
                          rating: 5,
                        ),
                        ReviewAndRatingCard(
                          onTap: () {},
                          title: 'Mr. Alif Iftekhar',
                          date: '05 : 19 pm',
                          time: '2022/06/19',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                          imagePath:
                              'assets/images/comapny_inner_page/review_and_rating_image2.png',
                          rating: 5,
                        ),
                        ReviewAndRatingCard(
                          onTap: () {},
                          title: 'Mr . Salim Abdullah',
                          date: '05 : 19 pm',
                          time: '2022/06/19',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                          imagePath:
                              'assets/images/comapny_inner_page/review_and_rating_image1.png',
                          rating: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
