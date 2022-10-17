import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:insta_daleel/global_members.dart';
import 'package:insta_daleel/screens/company/company_inner_page/company_inner_page_ui.dart';

class CompanyDisplayCard extends StatelessWidget {
  final bool isFeatured;
  final Function()? onTap;
  const CompanyDisplayCard({
    Key? key,
    this.isFeatured = false,
    required this.title,
    required this.image,
    required this.description,
    required this.rating,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String description;
  final String image;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CompanyInnerPage()));
      },
      child: Container(
        height: 95,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
            // left: leftRightGlobalMargin + 5,
            // right: leftRightGlobalMargin + 5,
            // top: 10,
            ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(
              companyCardBkg,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isFeatured)
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/main_page/bottom_navigation_bar/badge.png',
                        height: 20,
                        color: const Color.fromRGBO(255, 206, 49, 1),
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
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                description, //'lorem ipsum dilomakad aiqerjlk ah adflqjpwieru adakj pqeirj  akdnbvak;df ;qp pqwieurpu a dfj;qpeir',
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          RatingBarIndicator(
                            rating: rating,
                            textDirection: TextDirection.rtl,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 21.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
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
                        image: (image.contains('http'))
                            ? DecorationImage(
                                image: CachedNetworkImageProvider(image),
                                fit: BoxFit.cover,
                              )
                            : DecorationImage(
                                image: AssetImage(image),
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
    );
  }
}
