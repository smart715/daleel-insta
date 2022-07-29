import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constants/colors.dart';
import '../../../global_members.dart';

class PersonRatingCard extends StatelessWidget {
  const PersonRatingCard({Key? key, required this.title, required this.date, required this.time, required this.description, required this.imagePath, required this.rating, required this.onTap}) : super(key: key);

  final String title, date, time, description, imagePath;
  final double rating;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin, top: 15, bottom: 10),
        height: 160,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: const EdgeInsets.only(left: 10),
                    height: 30,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        title,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Color(InstaDaleelColors.primaryColor),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: RatingBarIndicator(
                      rating: rating,
                      textDirection: TextDirection.rtl,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 18.0,
                      direction: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                    child: Text(
                      '$time     $date',
                      style: const TextStyle(
                        color: Color(0xFF9B9898),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    height: 95,
                    child: Center(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          description,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 0, left: 6),
              child: Image(
                height: 90,
                width: 90,
                fit: BoxFit.contain,
                image: AssetImage(
                  imagePath,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
