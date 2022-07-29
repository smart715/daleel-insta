import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../main_page/featured_page/featured_page_widgets/featured_company_rating_card.dart';
import 'latest_reviews_widgets/latest_review_rating_card.dart';
import 'latest_reviews_widgets/person_rating_card.dart';

class LatestReviews extends StatefulWidget {
  const LatestReviews({Key? key}) : super(key: key);

  static const String latestReviewsRoute = 'LatestReviews';

  @override
  State<LatestReviews> createState() => _LatestReviewsState();
}

class _LatestReviewsState extends State<LatestReviews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //app bar
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
              height: 45,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(15),
                child: const Image(
                  height: 25,
                  width: 25,
                  fit: BoxFit.contain,
                  image: AssetImage(
                      'assets/images/main_page/app_bar/main_screen_appbar_help_info_icon.png'),
                ),
              ),
            ),
          ),
        ),
        // body
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: LatestReviewsRatingCard(
                        onTap: () {},
                        title: 'Global Architecture',
                        description: 'Lorem ipsum dolor sit amet, consectetur ',
                        imageAssetPath: 'assets/images/main_page/featured_page/2.png',
                        rating: 4.0,
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 20,
                      thickness: 2,
                    ),
                    PersonRatingCard(
                      onTap: () {},
                      title: 'Mr . Salim Abdullah',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                      date: '2022/06/19',
                      time: '05 : 19 pm',
                      imagePath: 'assets/images/latest_reviews/dp1.png',
                      rating: 5.0,
                    ),
                    PersonRatingCard(
                      onTap: () {},
                      title: 'Mr. Alif Iftekhar',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                      date: '2022/06/19',
                      time: '05 : 19 pm',
                      imagePath: 'assets/images/latest_reviews/dp2.png',
                      rating: 5.0,
                    ),
                    PersonRatingCard(
                      onTap: () {},
                      title: 'Mr . Bakhtier khan',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                      date: '2022/06/19',
                      time: '05 : 19 pm',
                      imagePath: 'assets/images/latest_reviews/dp3.png',
                      rating: 5.0,
                    ),
                    PersonRatingCard(
                      onTap: () {},
                      title: 'Mr . Rahmatullah',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                      date: '2022/06/19',
                      time: '05 : 19 pm',
                      imagePath: 'assets/images/latest_reviews/dp4.png',
                      rating: 5.0,
                    ),
                    PersonRatingCard(
                      onTap: () {},
                      title: 'Ms. Julie',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel eu libero, hendrerit est eu. Varius ac, id maecenas.',
                      date: '2022/06/19',
                      time: '05 : 19 pm',
                      imagePath: 'assets/images/latest_reviews/dp5.png',
                      rating: 5.0,
                    ),
                  ],
                )
            ),
          ),
        ),
      ],
    );
  }
}
