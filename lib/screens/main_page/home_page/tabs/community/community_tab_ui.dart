import 'package:flutter/material.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/community/community_tab_widgets/community_tab_small_card.dart';
import '../../../../../constants/colors.dart';
import '../../../../../global_members.dart';
import 'community_tab_widgets/community_tab_large_card.dart';

class CommunityTab extends StatefulWidget {
  const CommunityTab({Key? key}) : super(key: key);

  @override
  State<CommunityTab> createState() => _CommunityTabState();
}

class _CommunityTabState extends State<CommunityTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // Search View
          Container(
            height: 55,
            margin: const EdgeInsets.symmetric(horizontal: leftRightGlobalMargin, vertical: 15),
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

          // 'What is on your mind ?' container
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: leftRightGlobalMargin * 0.2, vertical: 10),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: const Text(
                  'What is on your mind ?',
                  style: TextStyle(
                    color: Color(InstaDaleelColors.primaryColor),
                    fontSize: 15,
                  ),

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

          // Add photos section
          InkWell(
            onTap: () {

            },
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Color(InstaDaleelColors.primaryColor),
                    size: 35,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Add Photos',
                    style: TextStyle(
                        color: Color(InstaDaleelColors.primaryColor),
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),

          // Small card 1
          CommunityTabSmallCard(
            communityTabSmallCardModel: CommunityTabSmallCardModel(
              onTap: () {},
              messageIconOnTap: (){},
              favouritiesIconOnTap: (){},
              personName: 'Abdul Rashid',
              personProfilePicPath: 'assets/images/main_page/home_page/community_tab/dp1.png',
              description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet more.......amet nullam sagittis malesuada. ',
              favoritiesIcon: Icons.favorite_border_outlined,
              favouritiesCount: 22,
              messageCount: 32,
            ),
          ),

          // Small card 2
          CommunityTabSmallCard(
            communityTabSmallCardModel: CommunityTabSmallCardModel(
              onTap: () {},
              messageIconOnTap: (){},
              favouritiesIconOnTap: (){},
              personName: 'Sayma Arsha',
              personProfilePicPath: 'assets/images/main_page/home_page/community_tab/dp2.png',
              description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet more.......amet nullam sagittis malesuada. ',
              favoritiesIcon: Icons.favorite_outlined,
              favouritiesCount: 08,
              messageCount: 32,
            ),
          ),

          // Large card 1
          CommunityTabLargeCard(
            communityTabLargeCardModel: CommunityTabLargeCardModel(
              onTap: () {
                Navigator.pushNamed(context, 'CommunityInsidePhotoPage');
              },
              messageIconOnTap: (){},
              favouritiesIconOnTap: (){},
              backgroundImagePath: 'assets/images/main_page/home_page/community_tab/bg1.png',
              personName: 'Karim Shaikh',
              personProfilePicPath: 'assets/images/main_page/home_page/community_tab/dp3.png',
              description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet more.......amet nullam sagittis malesuada. ',
              favoritiesIcon: Icons.favorite_outlined,
              favouritiesCount: 42,
              messageCount: 32,
            ),
          ),

          // Small card 3
          CommunityTabSmallCard(
            communityTabSmallCardModel: CommunityTabSmallCardModel(
              onTap: () {},
              messageIconOnTap: (){},
              favouritiesIconOnTap: (){},
              personName: 'Mike Pense',
              personProfilePicPath: 'assets/images/main_page/home_page/community_tab/dp4.png',
              description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet more.......amet nullam sagittis malesuada. ',
              favoritiesIcon: Icons.favorite_outlined,
              favouritiesCount: 08,
              messageCount: 32,
            ),
          ),

          // Large card 2
          CommunityTabLargeCard(
            communityTabLargeCardModel: CommunityTabLargeCardModel(
              onTap: () {},
              messageIconOnTap: (){},
              favouritiesIconOnTap: (){},
              backgroundImagePath: 'assets/images/main_page/home_page/community_tab/bg2.png',
              personName: 'Karim Shaikh',
              personProfilePicPath: 'assets/images/main_page/home_page/community_tab/dp5.png',
              description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet more.......amet nullam sagittis malesuada. ',
              favoritiesIcon: Icons.favorite_outlined,
              favouritiesCount: 42,
              messageCount: 32,
            ),
          ),
        ],
      ),
    );
  }
}
