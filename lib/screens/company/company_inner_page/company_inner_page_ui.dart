import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/global_members.dart';
import 'package:insta_daleel/screens/company/company_inner_page/company_inner_page_widgets/social_account_avatar.dart';
import 'package:insta_daleel/screens/company/company_inner_page/company_inner_page_widgets/google_map_and_rating.dart';
import 'package:insta_daleel/screens/company/company_inner_page/company_inner_page_widgets/reviews_and_rating_card.dart';
import 'package:insta_daleel/screens/company/company_inner_page/company_inner_page_widgets/university_rating_card.dart';
import 'package:insta_daleel/screens/company/company_inner_page/review_page.dart';

import 'company_inner_page_widgets/reverse_list_tile.dart';

class CompanyInnerPage extends StatefulWidget {
  const CompanyInnerPage({Key? key}) : super(key: key);
  static const String companyInnerPageRoute = 'CompanyInnerPage';

  @override
  State<CompanyInnerPage> createState() => _CompanyInnerPageState();
}

class _CompanyInnerPageState extends State<CompanyInnerPage> {
  bool showAddRatingButton = true;
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
                  'College & Universities',
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
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        height: 25,
                        width: 25,
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/images/main_page/app_bar/main_screen_appbar_notification_icon.png'),
                      ),
                    ),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Google Map and Rating text
                    const GoogleMapAndRating(
                      ratingText1: '4.5',
                      ratingText2: '32',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // University Rating Card
                    UniversityRatingCard(
                      universityRatingCardModel: UniversityRatingCardModel(
                        title: 'Queen’s University',
                        subtitle: 'Lorem ipsum dolor sit amet, consectetur ',
                        description:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet .......amet nullam sagittis malesuada. ',
                        imagePath:
                            'assets/images/comapny_inner_page/university_rating_card_image.png',
                        rating: 4.0,
                        badgeTap: () {},
                        heartTap: () {},
                        onTap: () {},
                      ),
                    ),
                    //TODO: CONTINUE HERE
                    // Reverse ListTiles
                    CompanyInnerPageReverseListTile(
                      onTap: () {},
                      title: 'Instagram Account',
                      subTitle: 'www.instagram.com/Insta_Daleel',
                      iconPath:
                          'assets/images/comapny_inner_page/instagram_account.png',
                    ),
                    CompanyInnerPageReverseListTile(
                      onTap: () {},
                      title: 'City',
                      subTitle: 'Sharjah',
                      iconPath: 'assets/images/comapny_inner_page/city.png',
                    ),
                    CompanyInnerPageReverseListTile(
                      onTap: () {},
                      title: 'Address',
                      subTitle: 'Lorem ipsum dolor sit amet, consectetur ',
                      iconPath: 'assets/images/comapny_inner_page/address.png',
                    ),
                    CompanyInnerPageReverseListTile(
                      onTap: () {},
                      title: 'Address',
                      subTitle: 'Lorem ipsum dolor sit amet, consectetur ',
                      iconPath: 'assets/images/comapny_inner_page/address.png',
                    ),
                    CompanyInnerPageReverseListTile(
                      onTap: () {},
                      title: 'Contact Number',
                      subTitle: '+999900012223',
                      iconPath:
                          'assets/images/comapny_inner_page/contact_number.png',
                    ),
                    CompanyInnerPageReverseListTile(
                      onTap: () {},
                      title: 'Website',
                      subTitle: 'www.abc.com',
                      iconPath: 'assets/images/comapny_inner_page/website.png',
                    ),
                    CompanyInnerPageReverseListTile(
                      onTap: () {},
                      title: 'Email Address',
                      subTitle: 'abc@gmail.com',
                      iconPath:
                          'assets/images/comapny_inner_page/email_address.png',
                    ),
                    CompanyInnerPageReverseListTile(
                      onTap: () {},
                      title: 'Office Hour',
                      subTitle: 'Sun-Fri : 08:00AM- 06:00 PM',
                      iconPath:
                          'assets/images/comapny_inner_page/office_hour.png',
                    ),
                    CompanyInnerPageReverseListTile(
                      onTap: () {},
                      title: 'Whats App',
                      subTitle: '+999900012223',
                      iconPath:
                          'assets/images/comapny_inner_page/whats_app.png',
                    ),

                    // Divider
                    const Divider(
                      color: Colors.white,
                      height: 30,
                      thickness: 3,
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    // Social accounts section
                    SizedBox(
                      height: 50,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SocialAccountAvatar(
                              onTap: () {},
                              iconPath:
                                  'assets/images/comapny_inner_page/instagram_account.png',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SocialAccountAvatar(
                              onTap: () {},
                              iconPath:
                                  'assets/images/comapny_inner_page/twitter.png',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SocialAccountAvatar(
                              onTap: () {},
                              iconPath:
                                  'assets/images/comapny_inner_page/facebook.png',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SocialAccountAvatar(
                              onTap: () {},
                              iconPath:
                                  'assets/images/comapny_inner_page/youtube.png',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SocialAccountAvatar(
                              onTap: () {},
                              iconPath:
                                  'assets/images/comapny_inner_page/telegram.png',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // 'Facilities & Majors' text section
                    const SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          'Facilities & Majors',
                          style: TextStyle(
                            color: Color(InstaDaleelColors.primaryColor),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // Facilities and majors image section
                    SizedBox(
                      height: 105,
                      child: Center(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 162,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(4, 4),
                                      blurRadius: 12,
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                    )
                                  ],
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/comapny_inner_page/image_one.png'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 162,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(4, 4),
                                      blurRadius: 12,
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                    )
                                  ],
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/comapny_inner_page/image_two.png',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Divider
                    const Divider(
                      color: Colors.white,
                      height: 30,
                      thickness: 3,
                    ),

                    // 'Reviews/Ratings' title section
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: (showAddRatingButton)
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Reviews/Ratings',
                            style: TextStyle(
                              color: Color(InstaDaleelColors.primaryColor),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          if (showAddRatingButton)
                            GestureDetector(
                              onTap: () {
                                showAddRatingButton = false;
                                setState(() {});
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: 95,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: const Color(
                                      InstaDaleelColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/main_page/featured_page/sbb.png'),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Add Rating',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                    if (!showAddRatingButton)
                      Container(
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(4, 4),
                              blurRadius: 9,
                              color: Color.fromRGBO(0, 0, 0, 0.03),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Add Rating',
                              style: TextStyle(
                                color: Color(InstaDaleelColors.primaryColor),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RatingBar(
                              initialRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                full: const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                half: const Icon(
                                  Icons.star_half,
                                  color: Colors.amber,
                                ),
                                empty: const Icon(
                                  Icons.star_border,
                                  color: Colors.amber,
                                ),
                              ),
                              itemSize: 25.0,
                              // itemPadding:
                              //     const EdgeInsets.symmetric(horizontal: 4.0),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: TextEditingController(),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Color.fromRGBO(55, 55, 55, 0.8),
                                    ),
                                    cursorColor: const Color(
                                        InstaDaleelColors.primaryColor),
                                    decoration: InputDecoration(
                                      hintText: "Leave a comment",
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 8),
                                      hintStyle: const TextStyle(
                                          fontSize: 11,
                                          color:
                                              Color.fromRGBO(55, 55, 55, 0.6)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          width: 1,
                                          color: Color(
                                            InstaDaleelColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          width: 1,
                                          color: Color(
                                            InstaDaleelColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 47,
                                  width: 47,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4,
                                        offset: Offset(0, 1),
                                        color: Color.fromRGBO(0, 0, 0, 0.1),
                                      ),
                                    ],
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/main_page/featured_page/sf.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/main_page/home_page/guide_tab/guide_tab_search_view_trailing_icon.png',
                                      fit: BoxFit.contain,
                                      width: 21,
                                      height: 21,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                    if (!showAddRatingButton)
                      const SizedBox(
                        height: 10,
                      ),

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
                    const SizedBox(
                      height: 10,
                    ),
                    // first 'see more'
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReviewPage(
                              title: 'Queen’s University',
                              description:
                                  'Lorem ipsum dolor sit amet, consectetur ',
                              rating: 4,
                              isFeatured: true,
                              image:
                                  'assets/images/comapny_inner_page/university_rating_card_image.png',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.only(right: leftRightGlobalMargin),
                        height: 30,
                        alignment: Alignment.centerRight,
                        child: const Text(
                          'See More',
                          style: TextStyle(
                            color: Color(InstaDaleelColors.primaryColor),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
