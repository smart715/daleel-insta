import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_widgets/guide_tab_rating_card.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_widgets/guide_tab_rating_slider.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_widgets/guide_tab_second_slider.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_widgets/guide_tab_third_slider.dart';
import '../../../../../global_members.dart';
import 'guide_tab_widgets/guide_tab_contact_us_section.dart';
import 'guide_tab_widgets/guide_tab_first_slider.dart';
import 'guide_tab_widgets/guide_tab_guide_section_circular_avatar.dart';
import 'guide_tab_widgets/guide_tab_online_now_section.dart';

class GuideTab extends StatefulWidget {
  const GuideTab({Key? key}) : super(key: key);

  @override
  State<GuideTab> createState() => _GuideTabState();
}

class _GuideTabState extends State<GuideTab> {
  List<GuideTabFirstSliderModel> guideTabFirstSliderModelList = [
    GuideTabFirstSliderModel(
      description: 'Get The Best\nShopping Offer From\nThe App 1!',
      imageAssetPath:
          'assets/images/main_page/home_page/guide_tab/first_slider_image.png',
      onTap: () {
        debugPrint('1');
      },
    ),
    GuideTabFirstSliderModel(
      description: 'Get The Best\nShopping Offer From\nThe App 2!',
      imageAssetPath:
          'assets/images/main_page/home_page/guide_tab/first_slider_image.png',
      onTap: () {
        debugPrint('2');
      },
    ),
    GuideTabFirstSliderModel(
      description: 'Get The Best\nShopping Offer From\nThe App 3!',
      imageAssetPath:
          'assets/images/main_page/home_page/guide_tab/first_slider_image.png',
      onTap: () {
        debugPrint('3');
      },
    ),
  ];

  List<GuideTabSecondSliderModel> guideTabSecondSliderModel = [
    GuideTabSecondSliderModel(
      title: 'Queen Arwa University',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet amet nullam sagittis malesuada. Nisl feugiat iaculis vitae scelerisque. ',
      imageAssetPath:
          'assets/images/main_page/home_page/guide_tab/guide_tab_second_slider_image.png',
      onTap: () {
        debugPrint('1');
      },
    ),
    GuideTabSecondSliderModel(
      title: 'Queen Arwa University',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet amet nullam sagittis malesuada. Nisl feugiat iaculis vitae scelerisque. ',
      imageAssetPath:
          'assets/images/main_page/home_page/guide_tab/guide_tab_second_slider_image.png',
      onTap: () {
        debugPrint('2');
      },
    ),
    GuideTabSecondSliderModel(
      title: 'Queen Arwa University',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet amet nullam sagittis malesuada. Nisl feugiat iaculis vitae scelerisque. ',
      imageAssetPath:
          'assets/images/main_page/home_page/guide_tab/guide_tab_second_slider_image.png',
      onTap: () {
        debugPrint('3');
      },
    ),
  ];

  List<GuideTabRatingCardModel> guideTabRatingCardModelList = [
    GuideTabRatingCardModel(
      title: 'Beauty Parlour & Spa',
      description:
      'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath:
      'assets/images/main_page/home_page/guide_tab/rating_image_one.png',
      rating: 4,
      onTap: () {
        debugPrint('1');
      },
    ),
    GuideTabRatingCardModel(
      title: 'IDEA TECH Services',
      description:
      'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath:
      'assets/images/main_page/home_page/guide_tab/rating_image_two.png',
      rating: 5,
      onTap: () {
        debugPrint('3');
      },
    ),
    GuideTabRatingCardModel(
      title: 'Doctor & Medical Service',
      description:
      'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath:
      'assets/images/main_page/home_page/guide_tab/rating_image_three.png',
      rating: 4,
      onTap: () {
        debugPrint('3');
      },
    ),
  ];

  List<GuideTabRatingCardSliderModel> guideTabRatingCardSliderModelList = [
    GuideTabRatingCardSliderModel(
      title: 'Global Architecture',
      description:
      'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath:
      'assets/images/main_page/home_page/guide_tab/rating_card_slider_image.png',
      rating: 5,
      onTap: () {
        debugPrint('1');
      },
    ),
    GuideTabRatingCardSliderModel(
      title: 'Global Architecture',
      description:
      'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath:
      'assets/images/main_page/home_page/guide_tab/rating_card_slider_image.png',
      rating: 5,
      onTap: () {
        debugPrint('2');
      },
    ),
    GuideTabRatingCardSliderModel(
      title: 'Global Architecture',
      description:
      'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath:
      'assets/images/main_page/home_page/guide_tab/rating_card_slider_image.png',
      rating: 5,
      onTap: () {
        debugPrint('3');
      },
    ),
  ];

  List<GuideTabThirdSliderModel> guideTabThirdSliderModelList = [
    GuideTabThirdSliderModel(
      personName: 'Abdul Rashid',
      favouritiesCount: 22,
      messageCount: 32,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet .......amet nullam sagittis malesuada. ',
      onTap: () {
        debugPrint('1');
      },
      favouritiesIconOnTap: () {
        debugPrint('2');
      },
      messageIconOnTap: () {
        debugPrint('3');
      },
    ),
    GuideTabThirdSliderModel(
      personName: 'Abdul Rashid',
      favouritiesCount: 22,
      messageCount: 32,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet .......amet nullam sagittis malesuada. ',
      // imageAssetPath: 'assets/images/main_page/home_page/guide_tab/rating_card_slider_image.png',
      onTap: () {
        debugPrint('2');
      },
      favouritiesIconOnTap: () {},
      messageIconOnTap: () {},
    ),
    GuideTabThirdSliderModel(
      personName: 'Abdul Rashid',
      favouritiesCount: 22,
      messageCount: 32,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet .......amet nullam sagittis malesuada. ',
      // imageAssetPath: 'assets/images/main_page/home_page/guide_tab/rating_card_slider_image.png',
      onTap: () {
        debugPrint('3');
      },
      favouritiesIconOnTap: () {},
      messageIconOnTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // first slider
          SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: GuideTabFirstSlider(
                guideTabFirstSliderModelList: guideTabFirstSliderModelList,
              )),

          // search view
          Container(
            height: 55,
            margin: const EdgeInsets.symmetric(horizontal: leftRightGlobalMargin),
            decoration: BoxDecoration(
                color: const Color(InstaDaleelColors.primaryColor),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'Search Here.....',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                    ),
                    cursorColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Image(
                    height: 25,
                    width: 25,
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/main_page/home_page/guide_tab/guide_tab_search_view_trailing_icon.png',
                    ),
                  ),
                ),
              ],
            ),
          ),

          // View All button section
          Container(
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: leftRightGlobalMargin),
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Browse The Guide’s Section',
                    style: TextStyle(
                      color: Color(InstaDaleelColors.primaryColor),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      debugPrint('View All');
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // circular avatar (guide) section
          SizedBox(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GuideTabGuideSectionCircularAvatar(
                  iconAssetPath:
                      'assets/images/main_page/home_page/guide_tab/shopping_cart.png',
                  description: 'Shopping And\nCommercial\nFacilities',
                  onTap: () {
                    Navigator.pushNamed(context, 'ShoppingMalls');
                  },
                ),
                GuideTabGuideSectionCircularAvatar(
                  iconAssetPath:
                      'assets/images/main_page/home_page/guide_tab/hospital.png',
                  description: 'Hospitals\nAnd\nHealth Center',
                  onTap: () {
                    Navigator.pushNamed(context, 'HospitalAndHealth');
                  },
                ),
                GuideTabGuideSectionCircularAvatar(
                  iconAssetPath: 'assets/images/main_page/home_page/guide_tab/restaurants.png',
                  description: 'Restaurants\nAnd\nCafeterias',
                  onTap: () {},
                ),
                GuideTabGuideSectionCircularAvatar(
                  iconAssetPath: 'assets/images/main_page/home_page/guide_tab/information_system.png',
                  description: 'Information\nSystem\nSoftware',
                  onTap: () {},
                ),
              ],
            ),
          ),

          // second slider
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: GuideTabSecondSlider(
              guideTabSecondSliderModelList: guideTabSecondSliderModel,
            ),
          ),

          // gold and currency card section
          Container(
            alignment: Alignment.topCenter,
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, 'GoldBuyingAndSellingPrice');
                  },
                  child: Container(
                    // margin: const EdgeInsets.only(left: 0), // it was 10.0
                    height: 90,
                    width: MediaQuery.of(context).size.width / 2 - 0, // it was 2 - 15
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                      'assets/images/main_page/home_page/guide_tab/rectangle_two.png',
                    ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Image(
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                          image: AssetImage(
                            'assets/images/main_page/home_page/guide_tab/ingots.png',
                          ),
                        ),
                        Text(
                          'Gold Buying\n& Selling\nPrice',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 0), // it was 10.0
                  height: 90,
                  width: MediaQuery.of(context).size.width / 2 - 0, // it was 2 - 15
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                    'assets/images/main_page/home_page/guide_tab/rectangle_one.png',
                  ))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Image(
                        height: 30,
                        width: 30,
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/images/main_page/home_page/guide_tab/exchange.png',
                        ),
                      ),
                      Text(
                        'Foreign\nCurrency\nExchange',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Latest Addition button
          Container(
            padding: const EdgeInsets.only(right: leftRightGlobalMargin),
            height: 50,
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {

              },
              child: const Text(
                'Latest Addition',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),

          // rating cards
          SizedBox(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: GuideTabRatingCard(
              guideTabRatingCardModel: guideTabRatingCardModelList[0],
            ),
          ),
          SizedBox(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: GuideTabRatingCard(
              guideTabRatingCardModel: guideTabRatingCardModelList[1],
            ),
          ),
          SizedBox(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: GuideTabRatingCard(
              guideTabRatingCardModel: guideTabRatingCardModelList[2],
            ),
          ),

          // first 'see more'
          Container(
            padding: const EdgeInsets.only(right: leftRightGlobalMargin),
            height: 50,
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
              },
              child: const Text(
                'See More',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),

          // divider
          const Divider(
            color: Colors.white,
            height: 30,
            thickness: 3,
          ),

          // Latest Review button
          Container(
            padding: const EdgeInsets.only(right: leftRightGlobalMargin),
            height: 50,
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'LatestCompanyReviews');
              },
              child: const Text(
                'Latest Review',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),

          // rating card slider
          SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: GuideTabRatingCardSlider(
              guideTabRatingCardSliderModelList: guideTabRatingCardSliderModelList,
            ),
          ),

          // second 'see more'
          Container(
            padding: const EdgeInsets.only(right: leftRightGlobalMargin),
            height: 50,
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {

              },
              child: const Text(
                'See More',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),

          // divider
          const Divider(
            color: Colors.white,
            height: 30,
            thickness: 3,
          ),

          // Latest Community button
          Container(
            padding: const EdgeInsets.only(right: leftRightGlobalMargin),
            height: 50,
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {

              },
              child: const Text(
                'Latest Community',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),

          // third slider
          SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: GuideTabThirdSlider(
                guideTabThirdSliderModelList: guideTabThirdSliderModelList,
              )),

          // third 'see more'
          Container(
            padding: const EdgeInsets.only(right: leftRightGlobalMargin),
            height: 50,
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {

              },
              child: const Text(
                'See More',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),

          // divider
          const Divider(
            color: Colors.white,
            height: 30,
            thickness: 3,
          ),

          // contact us section
          GestureDetector(
            onTap: () {
              debugPrint('Contact Us');
            },
            child: Container(
              color: Colors.transparent,
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: const GuideTabContactUsSection(),
            ),
          ),

          // divider
          const Divider(
            color: Colors.white,
            height: 30,
            thickness: 3,
          ),

          //online now section
          GestureDetector(
            onTap: () {
              debugPrint('40 people are online now');
            },
            child: Container(
              color: Colors.transparent,
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: const GuideTabOnlineNowSection(
                onlinePeopleCount: 40,
              ),
            ),
          ),
          // visits section
          /*GestureDetector(
            onTap: () {
              debugPrint('10,203,304 Visits');
            },
            child: Container(
              color: Colors.transparent,
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: const GuideTabVisitsCountSection(
                peopleVisitsCount: 10203304,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
