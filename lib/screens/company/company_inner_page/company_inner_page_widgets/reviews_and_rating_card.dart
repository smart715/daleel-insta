import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:insta_daleel/constants/colors.dart';

class ReviewAndRatingCard extends StatelessWidget {
  const ReviewAndRatingCard(
      {Key? key,
      required this.title,
      required this.date,
      required this.time,
      required this.description,
      required this.imagePath,
      required this.rating,
      required this.onTap})
      : super(key: key);

  final String title, date, time, description, imagePath;
  final double rating;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // height: 160,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 9,
                color: Color.fromRGBO(0, 0, 0, 0.03),
              )
            ]),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBarIndicator(
                        rating: rating,
                        textDirection: TextDirection.rtl,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 12.0,
                        direction: Axis.horizontal,
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          title,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Color(InstaDaleelColors.primaryColor),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$time    $date',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: Color.fromRGBO(55, 55, 55, 0.5),
                      fontSize: 9.5,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Center(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          description,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            color: Color.fromRGBO(55, 55, 55, 0.5),
                            fontSize: 9.5,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(2, 1),
                    blurRadius: 6,
                    color: Color.fromRGBO(74, 74, 74, 0.44),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
