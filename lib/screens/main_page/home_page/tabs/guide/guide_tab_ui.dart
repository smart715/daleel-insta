import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/screens/company/company_widgets/company_card_display.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_widgets/guide_tab_rating_card.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_widgets/guide_tab_rating_slider.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_widgets/guide_tab_second_slider.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_widgets/latest_post_section.dart';
import 'package:insta_daleel/screens/main_page/main_page_behavior.dart';
import '../../../../../global_members.dart';
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
      description: 'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath:
          'assets/images/main_page/home_page/guide_tab/rating_image_one.png',
      rating: 4,
      onTap: () {
        debugPrint('1');
      },
    ),
    GuideTabRatingCardModel(
      title: 'IDEA TECH Services',
      description: 'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath:
          'assets/images/main_page/home_page/guide_tab/rating_image_two.png',
      rating: 5,
      onTap: () {
        debugPrint('3');
      },
    ),
    GuideTabRatingCardModel(
      title: 'Doctor & Medical Service',
      description: 'Lorem ipsum dolor sit amet, consectetur ',
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
      description: 'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath:
          'assets/images/main_page/home_page/guide_tab/rating_card_slider_image.png',
      rating: 5,
      onTap: () {
        debugPrint('1');
      },
    ),
    GuideTabRatingCardSliderModel(
      title: 'Global Architecture',
      description: 'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath:
          'assets/images/main_page/home_page/guide_tab/rating_card_slider_image.png',
      rating: 5,
      onTap: () {
        debugPrint('2');
      },
    ),
    GuideTabRatingCardSliderModel(
      title: 'Global Architecture',
      description: 'Lorem ipsum dolor sit amet, consectetur ',
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
          const SizedBox(
            height: 20,
          ),
          // Ad Banner
          const GuideTabAdBanner(),

          const SizedBox(
            height: 10,
          ),
          // search view
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xff22A8F3),
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(34, 168, 243, 0.5),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 30),
                      hintText: 'Search Here.....',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                    cursorColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
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
          SizedBox(
            height: 60,
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
          const GuideTabCategorySection(),

          // second slider
          GuideTabSecondSlider(
            guideTabSecondSliderModelList: guideTabSecondSliderModel,
          ),

          const SizedBox(
            height: 8,
          ),

          // box section
          const BoxSection(),

          const SizedBox(
            height: 10,
          ),
          // Latest Addition button
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(right: leftRightGlobalMargin),
              height: 30,
              alignment: Alignment.centerRight,
              child: const Text(
                'Latest Addition',
                style: TextStyle(
                  color: Color(InstaDaleelColors.primaryColor),
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),

          // rating cards
          SizedBox(
            height: 3 * 105,
            child: ListView.builder(
              itemCount: guideTabRatingCardModelList.length * 2,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index.isOdd) {
                  return const SizedBox(
                    height: 10,
                  );
                }
                int i = index ~/ 2;
                final c = guideTabRatingCardModelList[i];
                return CompanyDisplayCard(
                  title: c.title,
                  description: c.description,
                  image: c.imageAssetPath,
                  rating: c.rating,
                );
              },
            ),
          ),
          // first 'see more'
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(right: leftRightGlobalMargin),
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

          // divider
          const Divider(
            color: Colors.white,
            height: 15,
            thickness: 3,
          ),

          // Latest Review button
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(right: leftRightGlobalMargin),
              height: 30,
              // color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Text(
                'Latest Review',
                style: TextStyle(
                  color: Color(InstaDaleelColors.primaryColor),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // rating card slider
          GuideTabRatingCardSlider(
            guideTabRatingCardSliderModelList:
                guideTabRatingCardSliderModelList,
          ),

          // second 'see more'
          // Latest Review button
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(right: leftRightGlobalMargin),
              height: 30,
              // color: Colors.red,
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

          // divider
          const Divider(
            color: Colors.white,
            height: 20,
            thickness: 3,
          ),

          // Latest Community text

          InkWell(
            child: Container(
              padding: const EdgeInsets.only(right: leftRightGlobalMargin),
              height: 30,
              // color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Text(
                'Latest Community',
                style: TextStyle(
                  color: Color(InstaDaleelColors.primaryColor),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          // const CommunityPostCard(
          //   personName: 'Abdul Rashid',
          //   imageUrl:
          //       'https://scontent-lhr8-1.xx.fbcdn.net/v/t39.30808-6/311233719_2264720030344593_3533777974738364520_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=_Fda4M2Yb_YAX-fZb1s&_nc_ht=scontent-lhr8-1.xx&oh=00_AT_b1OEOXfeod1Y5Ct7OKxHgMd3kToBcuGI0QF3aMjUXkw&oe=63467267',
          //   personProfilePicLink:
          //       'https://www.elitesingles.co.uk/wp-content/uploads/sites/59/2019/11/2b_en_articleslide_sm2-350x264.jpg',
          //   postText:
          //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet amet nullam sagittis malesuada. ',
          //   likesCount: 23,
          //   commentsCount: 32,
          //   showImage: true,
          //   isLiked: false,
          //   customerId: -1,
          // ),

          // const SizedBox(
          //   height: 10,
          // ),
          // Latest Posts PageView.Builder
          const LatestPost(),

          // third 'see more'

          InkWell(
            child: Container(
              padding: const EdgeInsets.only(right: leftRightGlobalMargin),
              height: 30,
              // color: Colors.red,
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

          // divider
          const Divider(
            color: Colors.white,
            height: 20,
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
            height: 20,
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
