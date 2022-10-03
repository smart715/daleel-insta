import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_behavior.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_widgets/guide_tab_rating_card.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_widgets/guide_tab_rating_slider.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_widgets/guide_tab_second_slider.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_widgets/latest_post_section.dart';
import 'package:insta_daleel/screens/main_page/main_page_behavior.dart';
import '../../../../../global_members.dart';
import '../../home_page_behavior.dart';
import 'guide_tab_widgets/guide_tab_box_section.dart';
import 'guide_tab_widgets/guide_tab_contact_us_section.dart';
import 'guide_tab_widgets/guide_tab_ad_banner.dart';
import 'guide_tab_widgets/guide_tab_category_section.dart';
import 'guide_tab_widgets/guide_tab_online_now_section.dart';

class GuideTab extends StatefulWidget {
  const GuideTab({Key? key}) : super(key: key);

  @override
  State<GuideTab> createState() => _GuideTabState();
}

class _GuideTabState extends State<GuideTab> {

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // Ad Banner
          const GuideTabAdBanner(),

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
                      MainPageBehavior.currentIndex = 0;
                      MainPageBehavior.setStateOfMainPageScreen();
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
          Container(
            alignment: Alignment.center,
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: const GuideTabCategorySection(),
          ),

          // second slider
          SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: GuideTabSecondSlider(
              guideTabSecondSliderModelList: guideTabSecondSliderModel,
            ),
          ),

          // box section
          Container(
            alignment: Alignment.topCenter,
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: const BoxSection(),
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

          // Latest Community text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // refresh post
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: () {
                    GuideTabBehavior.latestPostSliderIndex = 0;
                    GuideTabBehavior.setStateOfGuideTabLatestPostListView();
                  },
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.replay_circle_filled_rounded,
                          color: Color(InstaDaleelColors.primaryColor),
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: leftRightGlobalMargin),
                child: Text(
                  'Latest Community',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(InstaDaleelColors.primaryColor)
                  ),
                ),
              ),
            ],
          ),

          // Latest Posts PageView.Builder
          SizedBox(
              height: 175,
              width: MediaQuery.of(context).size.width,
              child: const LatestPost()),

          // third 'see more'
          Container(
            padding: const EdgeInsets.only(right: leftRightGlobalMargin),
            height: 50,
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                HomePageBehavior.homePageTabController.index = 3;
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
