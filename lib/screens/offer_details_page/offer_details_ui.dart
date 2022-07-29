import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../constants/colors.dart';
import '../../global_members.dart';

class OfferDetails extends StatefulWidget {
  const OfferDetails({Key? key}) : super(key: key);
  static const String offerDetailsRoute = 'OfferDetails';

  @override
  State<OfferDetails> createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // app bar
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
                'Offer Details',
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
                  // event detail image
                  const Image(
                    image: AssetImage(
                      'assets/images/offer_details/offer_detail_image.png',
                    ),
                  ),

                  // '10 Years Service Free On All...' text
                  Container(
                    height: 70,
                    alignment: Alignment.center,
                    child: const Text(
                      '10 Years Service Free On All\nSUV and Other Cars',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(InstaDaleelColors.primaryColor),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  // event detail text
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: leftRightGlobalMargin),
                    alignment: Alignment.center,
                    child: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet laoreet dictum nec, molestie. Eget felis turpis dui, scelerisque volutpat odio venenatis. Interdum quis malesuada cras commodo justo, lectus et. Sit placerat mauris erat quam feugiat aliquam in est. Odio quis eget eget morbi sed. Dolor curabitur in nulla ut leo vitae. Egestas varius blandit turpis facilisis diam. Nulla id ac faucibus viverra urna euismod. Nisl at scelerisque sem egestas faucibus. Non sed ridiculus senectus turpis nunc ut etiam. Pellentesque sed ullamcorper aliquam urna augue vitae bibendum. molestie. Eget felis turpis dui, scelerisque volutpat odio venenatis. Interdum quis malesuada cras commodo justo, lectus et. Sit placerat mauris erat quam feugiat aliquam in est. Odio quis eget eget morbi sed. Dolor curabitur in nulla ut leo vitae. Egestas varius blandit turpis facilisis diam. Nulla id ac faucibus viverra urna euismod. Nisl at scelerisque sem egestas faucibus. Non sed ridiculus senectus turpis nunc ut etiam. Pellentesque sed ullamcorper aliquam urna augue vitae bibendum. ',
                      textAlign: TextAlign.justify,
                    ),
                  ),

                  // size box
                  const SizedBox(
                    height: 20,
                  ),

                  // divider
                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: leftRightGlobalMargin,
                    endIndent: leftRightGlobalMargin,
                  ),

                  // date and time text
                  Container(
                    height: 30,
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(right: leftRightGlobalMargin),
                    child: const Text(
                      'Tuesday, 8:00 PM - 2022/07/07',
                      style: TextStyle(
                          color: Color(InstaDaleelColors.primaryColor),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  // rating card
                  Container(
                    height: 110,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin, top: 20),
                    decoration: BoxDecoration(
                        color: const Color(InstaDaleelColors.primaryColor),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Global Architecture',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8.0, left: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur ',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              RatingBarIndicator(
                                rating: 5.0,
                                textDirection: TextDirection.rtl,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 25.0,
                                direction: Axis.horizontal,
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10, bottom: 0, left: 6),
                          child: Image(
                            height: 90,
                            width: 90,
                            fit: BoxFit.contain,
                            image: AssetImage(
                              'assets/images/main_page/home_page/guide_tab/rating_card_slider_image.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // size box
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
